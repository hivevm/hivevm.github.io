---
title: "NUC: a nucleus for building software with coding agents"
date: 2026-09-19
author: HiveVM
description: >-
  Why HiveVM projects start from a small, specification- and ADR-driven template —
  and how coding agents work inside it without losing the reasoning behind the code.
---

Coding agents write code fast. What they lose just as fast is the *why*: a structural
decision made silently in one session is forgotten in the next, the reasoning lives in a
chat log nobody reads again, and every agent follows slightly different house rules. The
faster the code grows, the harder it gets to review.

**NUC** is HiveVM's answer: a starting point for building software with coding agents
inside a ready-to-use Dev Container, where the work is driven by a written specification
and Architecture Decision Records — so intent and reasoning stay explicit and reviewable.

## Why "NUC"?

In beekeeping, a *nucleus colony* — a NUC — is the small starter colony a full hive grows
from: a queen, a few frames of bees and brood, everything the colony needs to expand on
its own. The template is the same idea: a compact, ready-made nucleus that a complete
project grows out of.

## What is in the nucleus

The template is deliberately small. Each part has one job:

- **Dev Container** — a reproducible environment built from a prebuilt base image plus
  Dev Container Features, no Dockerfile to maintain. The Claude Code and Mistral Vibe
  extensions are preinstalled; other agents work too once you add them.
- **`AGENTS.md`** — the single source of truth for every coding agent. Most agents read it
  natively; Claude Code gets a one-line pointer to it. Rules are never duplicated per agent.
- **`docs/SPECIFICATION.md`** — the *constitution* of the project: problem, goals,
  vocabulary and success criteria.
- **`docs/adr/`** — Architecture Decision Records, one per decision that is costly to
  reverse or constrains future choices.
- **Consistency checks** — scripts that keep the ADR index and documentation links in sync,
  enforced in CI.

## The rules agents follow

Authority runs in one direction: **specification → accepted ADRs → task**. Every change
respects both, and a few rules keep humans in charge of the decisions that matter:

- **ADR first.** Before an architecture-relevant change — a new dependency, a public
  interface, a protocol or data format — the agent writes an ADR with status `proposed`,
  then stops and asks for review.
- **Only humans accept.** Agents may propose; only a human reviewer moves an ADR to
  `accepted`. Accepted ADRs are binding and never edited — a changed decision gets a new
  ADR that supersedes the old one.
- **Git writes need approval.** Commits and pushes require an explicit go-ahead every time;
  the preconfigured Claude Code permissions ask before `git add`, `commit`, `push` and `gh`.
- **Small, reviewable steps.** Research before design, surface the reasoning, ask when the
  scope is unclear.

Not everything needs an ADR. Bug fixes, tests, docs and refactorings that keep public
interfaces intact just get done — the rule of thumb is whether a change locks anything in.

## Growing a project from it

Create a repository from the template on GitHub, open it in VS Code and choose
**Reopen in Container**. Then initialize it — ask your coding agent to bootstrap, or run the
script yourself:

```bash
bash scripts/init-template.sh --modules git-conventions,release
```

The script keeps the policy modules you choose, prunes the rest, sets the license and
copyright holder, and then deletes itself. The optional modules are:

- **`git-conventions`** — branch naming, Conventional Commit subjects and squash merges,
  checked in CI.
- **`supply-chain`** — GitHub Actions pinned to major version tags, secrets rules and
  Dependabot updates.
- **`release`** — SemVer and a keep-a-changelog `CHANGELOG.md`, with a human-only release
  process.
- **`conformance`** — for projects derived from an external specification or project.

From there, write your specification, record the first decisions as ADRs, add the
language toolchain your project needs — the base image ships none — and start working
with the agent.

## How it fits HiveVM

HiveVM's idea is *model once, run anywhere*: describe the logic once as a model and let
the platform change around it. NUC applies the same thinking to the project itself. The
specification and the ADRs are the model of the project — what it is for and why it is
built the way it is — and the agents derive the code from it. Agents, tools and even the
code can change; the written intent stays. This website's own repository follows the same
structure.

## Where to go next

Start a new project straight from the [template](https://github.com/hivevm/nuc/generate),
or read the [source on GitHub](https://github.com/hivevm/nuc) first.
