---
title: "LL(k) parsing, explained simply"
date: 2026-03-12
author: HiveVM
description: >-
  What the “k” in LL(k) actually buys you, and how lookahead lets a generated
  parser stay predictable without backtracking.
---

The parser generator is an **LL(k)** generator. That label is doing a lot of work, so
this post unpacks it without the formal machinery.

## Reading the name

The three parts each mean something concrete:

- **L** — the input is read **L**eft to right.
- **L** — it builds a **L**eftmost derivation (it always expands the leftmost rule first).
- **k** — it may look ahead **k** tokens before deciding which rule to take.

The interesting part is the `k`. With one token of lookahead, some grammars are
ambiguous; with two, the ambiguity disappears.

## A concrete example

Consider two rules that both start with an identifier:

```
statement : assignment | call ;
assignment: ID '=' expr ;
call      : ID '(' args ')' ;
```

With a single token (`k = 1`) the parser only sees `ID` and cannot tell which rule
applies. With `k = 2` it also sees the next token — `=` versus `(` — and the choice is
immediate:

```java
// generated decision, conceptually:
if (la(2).type == ASSIGN) {
    return parseAssignment();
} else {
    return parseCall();
}
```

No backtracking, no guessing — just a fixed amount of lookahead.

## Why it stays fast

Because the lookahead is bounded by `k`, every decision is made in constant time. The
generated parser is predictable: its worst case is its average case. That predictability
is exactly what makes generated parsers pleasant to embed in editors and build tools.

## Try it

Point the generator at your own grammar and read the code it produces:

```bash
hivevm-cc generate MyGrammar.g --target java
```

The source lives in [hivevm/cc](https://github.com/hivevm/cc).
