---
title: "Waggle"
kind: "Parser generator"
weight: 10
description: "Generates a parser and a full AST for Java, C++ and Rust from a single grammar."
---

A parser generator reads a grammar and turns it into a program that recognizes it. Waggle generates
top-down, recursive-descent parsers: `LL(1)` by default, with `LL(k)` lookahead where a grammar
needs it. Generated parsers carry no Waggle runtime dependency.

## One grammar, one step

Lexical rules, productions and tree building all live in one `.waggle` file. Annotate a production
with `#Node` and the tree is part of the grammar, so there is no separate pre-processing pass. The
same grammar can be emitted as Java, C++ or Rust.

## Using it

Waggle runs as a Gradle plugin rather than a command line tool. Each `task` in a `parserProject`
block produces one parser from one grammar, and `generateParser` runs them:

```groovy
plugins {
  id "org.hivevm.waggle" version "1.0.0"
}

parserProject {
  target = 'java'                 // java | cpp | rust
  output = 'src/main/generated'

  task {
    name = 'parser'
    file = 'src/main/resources/Waggle.waggle'
  }
}
```

## Where it comes from

Waggle started as a fork of JavaCC 7.0.13 and keeps its conceptual model. It is no longer
grammar-compatible, so JavaCC grammars have to be migrated.

## Why "Waggle"?

Honeybees talk in the *waggle dance*: a forager encodes the direction and distance of a food source
in a figure-eight run, and the other bees *parse* the dance to find it. A grammar that others read.
