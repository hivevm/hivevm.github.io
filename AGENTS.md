# Agent Guide

> **Single source of truth for all coding agents** (Claude Code, Codex, Cursor, Mistral Vibe,
> GitHub Copilot, OpenCode). Most agents read this file natively; only Claude Code requires the
> `.claude/CLAUDE.md` pointer. Never duplicate rules into that pointer — add them here.

Human-facing setup — prerequisites, the Dev Container, and the project description —
lives in [`README.md`](README.md). Do not duplicate that information here.

## 1. Start here

Before any non-trivial work, read:

1. [`docs/SPECIFICATION.md`](docs/SPECIFICATION.md) — the **specification** (problem, goals, core
   concepts, vocabulary, success criteria).
2. [`docs/adr/`](docs/adr/) — the Architecture Decision Records. **Accepted ADRs are binding**.

## 2. ADR rules

Authority runs **specification → accepted ADRs → task**: the specification in
[`docs/SPECIFICATION.md`](docs/SPECIFICATION.md) is the constitution, accepted ADRs derive from it,
and every task respects both. The full ADR mechanics — numbering, template, lifecycle, and the
index — live in [`docs/adr/README.md`](docs/adr/README.md).

1. **Create an ADR before any architecture-relevant decision** — adding a dependency or framework,
   designing or changing a public interface, choosing a persistence/synchronization strategy or a
   protocol/data format, or anything that constrains future technology choices (non-exhaustive). Copy
   [`docs/adr/template.md`](docs/adr/template.md), set status `proposed`, then **stop and ask for
   human review** before implementing.
2. **Never violate an accepted ADR.** If a task conflicts with one, do not silently work around it —
   propose a new ADR (status `proposed`) that supersedes it.
3. **You may set status `proposed` only; only a human reviewer changes it.** Never edit an accepted
   ADR — change a decision with a *new* ADR that supersedes it. **ADR numbers are permanent — never
   renumber, delete, or merge ADRs;** superseded ones remain as historical record.
4. **The specification wins.** If the specification and an ADR conflict, raise the conflict — do not
   choose silently.
5. **Use the project vocabulary** from the specification consistently in code, comments, and documentation.
6. **Calibrate — not everything needs an ADR.** ADRs are for decisions that are *costly to reverse* or
   *constrain future choices*. Routine, local, easily reversible work does **not** need one: implementing
   within an accepted ADR, bug fixes, refactorings that preserve public interfaces, tests, docs,
   formatting, or a dev-only tool that no shipped code depends on. Rule of thumb: if a change locks in
   nothing and could be undone in a single follow-up commit, skip the ADR. When genuinely unsure, prefer
   a short `proposed` ADR over a silent decision.
7. **Keep the ADR index current.** When you add, supersede, or change the status of an ADR, update the
   index in [`docs/adr/README.md`](docs/adr/README.md) **in the same change** — never as a separate
   afterthought.

## 3. Working style

- **Communicate with the human in the author's own language**, but write **all artifacts**
  (code, comments, commits, docs, ADRs, PRs) in **English**.
- Prefer **small, reviewable changes**; for larger ones, plan and explore the codebase before
  editing. Reference the relevant ADR(s) in commit messages and pull request descriptions
  (e.g., `Implements ADR-NNNN`).
- **Work interactively and iteratively**: proceed in small steps, surface your reasoning, and seek
  feedback early rather than delivering large changes at once.
- **Research before any conceptual design.** For every conceptual or design decision, first research
  the state of the art and established solutions — including external/web sources — instead of relying
  on assumptions or memory alone. Capture the relevant findings and cite them (in the ADR when one
  applies).
- When in doubt about scope or intent, ask the human before implementing.
- **Verify claims critically.** Do not take assertions — your own or the author's — at face value;
  check them against the code, the specification, the ADRs, and authoritative sources. Flag what you
  cannot confirm.

## 4. Project rules

- Leave all git write operations (`add`, `commit`, `push`, …) to the user. Do not run them.
- Build, test, and run commands live in the **Build, Test & Run** section of
  [`README.md`](README.md) — the single source for both humans and agents.