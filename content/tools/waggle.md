---
# The facts about a tool live here only (ADR-0008); the home page, /tools/ and the footer read them.
# Where the blog post used to be; old links redirect here.
aliases: ["/blog/ll-k-parsing-explained/"]
title: "Waggle"
kind: "Parser generator"
role: derive
weight: 10
tagline: "one grammar, a parser for Java, C++ and Rust"
description: >-
  An LL(k) parser generator that turns a single grammar into a recursive-descent parser and a full AST for Java, C++ and Rust, with no runtime dependency.
lang: Java
lang_color: "#b07219"
license: BSD-3-Clause
# release | build-from-source | template. No GitHub release; the plugin is released on the Gradle
# Plugin Portal (org.hivevm.waggle), checked 2026-11-10.
status: release
repo: https://github.com/hivevm/waggle
---

A parser generator reads a grammar and turns it into a program that recognizes it. Waggle generates
top-down, recursive-descent parsers: `LL(1)` by default, with `LL(k)` lookahead where a grammar needs
it. From a single `.waggle` grammar it emits a parser and a full AST for Java, C++ and Rust, and the
generated parsers carry no Waggle runtime dependency.

## A grammar, end to end

A grammar is one declarative file. Lexical rules and productions sit side by side. Here is a small
expression language, `Calc.waggle`:

```
grammar Calc;

Input  = Expr() <EOF> ;
Expr   = Term() ( ( <PLUS> | <MINUS> ) Term() )* ;
Term   = Factor() ( ( <TIMES> | <DIVIDE> ) Factor() )* ;
Factor = <NUMBER> | <LPAREN> Expr() <RPAREN> ;

SKIP  = " " | "\t" | "\n" | "\r" ;
TOKEN =
  < PLUS: "+" > | < MINUS: "-" >
| < TIMES: "*" > | < DIVIDE: "/" >
| < LPAREN: "(" > | < RPAREN: ")" >
| < NUMBER: (["0"-"9"])+ > ;
```

Tree building is part of the same grammar: annotate a production or an expansion with `#Node`, and
the parser builds the tree as it parses. There is no separate pre-processing pass.

## How LL(k) decides

The name says how the parser works:

- **L**: the input is read left to right.
- **L**: it builds a leftmost derivation, always expanding the leftmost rule first.
- **k**: it may look ahead `k` tokens before deciding which rule to take.

Two rules that both start with an identifier cannot be told apart by one token:

```
Statement  = Assignment() | Call() ;
Assignment = <ID> <ASSIGN> Expr() ;
Call       = <ID> <LPAREN> Args() <RPAREN> ;
```

With a second token, `=` versus `(`, the choice is immediate. Waggle asks for the extra token only at
the choice that needs it:

```
Statement = LOOKAHEAD(2) Assignment() | Call() ;
```

There is no backtracking and no guessing. Because the lookahead is bounded, every decision takes
constant time, and the parser's worst case is its average case. That predictability makes generated
parsers pleasant to embed in editors and build tools.

## Using it

Waggle runs as a Gradle plugin rather than a command line tool. Each `task` in a `parserProject`
block produces one parser from one grammar, and `./gradlew generateParser` runs them:

```groovy
plugins {
  id "org.hivevm.waggle" version "1.0.0"
}

parserProject {
  target = 'java'                 // java | cpp | rust
  output = 'src/main/generated'

  task {
    name = 'calc'
    file = 'src/main/resources/Calc.waggle'
  }
}
```

Edit the grammar, regenerate, and the parser follows; there is no boilerplate to keep in sync by
hand. The repository's [tutorials](https://github.com/hivevm/waggle/tree/main/docs/tutorials) build a
grammar from scratch and cover lookahead, the token manager and error handling.

## Where it comes from

Waggle started as a fork of JavaCC 7.0.13 and keeps its proven model: `LL(k)` recursive descent, a
token manager with lexical states, and syntactic and semantic lookahead. What changed is the surface:

- **A simplified, EBNF-like syntax.** Productions read `name = expansion ;`, and a `grammar Name;`
  line with an `options { … }` block opens the file.
- **One grammar, one step.** `#Node` annotations replace the separate JJTree pass.
- **Multiple targets.** The same grammar can be emitted as Java, C++ or Rust.

Because the syntax was redesigned, JavaCC grammars have to be migrated; compatibility is at the level
of concepts and features, not source.

## In HiveVM

Waggle derives a result from a model: the grammar describes the language, and the parser follows from
it for every target.

## Why "Waggle"?

Honeybees talk in the *waggle dance*: a forager encodes the direction and distance of a food source
in a figure-eight run, and the other bees in the hive *parse* the dance to find it. A grammar that
others read is exactly what a parser generator is about.
