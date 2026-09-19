---
title: "Introducing HiveVM: model once, run anywhere"
date: 2026-02-10
author: HiveVM
description: >-
  Why we describe applications as models — so the application and business logic
  stay while technology and platform change.
---

HiveVM is built around one idea: describe an application **once** as a model — its
application and business logic — and run it **anywhere**, independent of technology and
platform. The platform may change; the model stays. The HiveVM tools and projects apply
the same idea at every level: a grammar becomes a parser, a folder of Markdown becomes a
manual, a specification becomes a project.

This post is a short tour of the toolkit and the thinking behind it.

## One source of truth

Most software drifts because the same knowledge is written down in several places — once
in the code for each platform, once in the docs, once in the build. Each copy ages at its
own pace, and every platform change means rewriting logic that has not changed at all.
Modelling collapses those copies into a single declarative source.

> Describe the intent once and let the tooling project it onto each target.

## The three tools

The toolkit is intentionally small:

- **Parser Generator (Waggle)** — an LL(k) generator that emits a parser and a full AST for
  Java, C++ and Rust from one grammar.
- **Manual Generator** — turns a collection of CommonMark files into one coherent manual.
- **Agent Template (NUC)** — a starting point for building software with coding agents
  inside a ready-to-use Dev Container, driven by a written specification and ADRs.

Each lives in its own public repository, so you can adopt one without the others.

## A grammar, end to end

A grammar is just a declarative `.waggle` file. Here is a tiny expression language,
`Calc.waggle`:

```
grammar Calc;

expr   : term (('+' | '-') term)* ;
term   : factor (('*' | '/') factor)* ;
factor : NUMBER | '(' expr ')' ;

NUMBER : [0-9]+ ('.' [0-9]+)? ;
```

Running Waggle produces a parser plus AST nodes for every target you ask for:

```bash
waggle generate Calc.waggle --target java,cpp
```

That is the whole loop — edit the model, regenerate, ship. No boilerplate to keep in
sync by hand.

### Why "Waggle"?

The *waggle dance* is the language of bees: a kind of grammar in which a forager encodes
the direction and distance of a food source, and the other bees in the hive *parse* the
dance to find it. That is what a parser generator is about, too: a grammar describes a
language, and the generated parser reads it.

## Where to go next

Browse the [repositories on GitHub](https://github.com/hivevm) or start with
[Waggle](https://github.com/hivevm/waggle), the parser generator. The next post digs into how LL(k)
analysis actually decides what to generate.
