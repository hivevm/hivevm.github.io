---
title: "LL(k) parsing, explained simply"
date: 2026-03-12
author: HiveVM
description: >-
  What the “k” in LL(k) actually buys you, and how lookahead lets a generated
  parser stay predictable without backtracking.
---

Waggle, the HiveVM parser generator, is an **LL(k)** generator. That label is doing a lot of work, so
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
Statement  = Assignment() | Call() ;
Assignment = <ID> <ASSIGN> Expr() ;
Call       = <ID> <LPAREN> Args() <RPAREN> ;
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

No backtracking, no guessing — just a fixed amount of lookahead. Waggle generates `LL(1)` by
default, so you ask for the extra token only at the choice that needs it:

```
Statement = LOOKAHEAD(2) Assignment() | Call() ;
```

## Why it stays fast

Because the lookahead is bounded by `k`, every decision is made in constant time. The
generated parser is predictable: its worst case is its average case. That predictability
is exactly what makes generated parsers pleasant to embed in editors and build tools.

## Try it

Apply the `org.hivevm.waggle` Gradle plugin, point a `task` at your own grammar and read the code
it produces:

```bash
./gradlew generateParser
```

The source lives in [hivevm/waggle](https://github.com/hivevm/waggle).
