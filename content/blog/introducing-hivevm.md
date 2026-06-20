---
title: "Introducing HiveVM: tools built on modelling"
date: 2026-02-10
author: HiveVM
description: >-
  Why we build developer tools around explicit models — grammars, documents and
  workflows — instead of hand-written boilerplate.
---

HiveVM is a small family of developer tools with one idea in common: describe the
**model** once, then generate everything that follows from it. A grammar becomes a
parser. A folder of Markdown becomes a manual. A workflow definition becomes a build
pipeline.

This post is a short tour of the toolkit and the thinking behind it.

## One source of truth

Most toolchains drift because the same knowledge is written down in several places —
once in the parser, once in the docs, once in the CI config. Each copy ages at its own
pace. Modelling collapses those copies into a single declarative source.

> Describe the intent once and let the tooling project it onto each target.

## The three tools

The toolkit is intentionally small:

- **Parser Generator** — an LL(k) generator that emits a parser and a full AST for Java
  and C++ from one grammar.
- **Manual Generator** — turns a collection of CommonMark files into one coherent manual.
- **Gradle Workflow** — a single pipeline definition across heterogeneous build systems.

Each lives in its own public repository, so you can adopt one without the others.

## A grammar, end to end

A grammar is just a declarative file. Here is a tiny expression language:

```
grammar Calc;

expr   : term (('+' | '-') term)* ;
term   : factor (('*' | '/') factor)* ;
factor : NUMBER | '(' expr ')' ;

NUMBER : [0-9]+ ('.' [0-9]+)? ;
```

Running the generator produces a parser plus AST nodes for every target you ask for:

```bash
hivevm-cc generate Calc.g --target java,cpp
```

That is the whole loop — edit the model, regenerate, ship. No boilerplate to keep in
sync by hand.

## Where to go next

Browse the [repositories on GitHub](https://github.com/hivevm) or start with the
[parser generator](https://github.com/hivevm/cc). The next post digs into how LL(k)
analysis actually decides what to generate.
