---
# The facts about a tool live here only (ADR-0008); the home page, /tools/ and the footer read them.
# Where the blog post used to be; old links redirect here.
aliases: ["/blog/introducing-nuc/"]
title: "NUC"
kind: "Agent template"
role: govern
weight: 40
tagline: "a nucleus for building software with coding agents"
description: >-
  A repository template for building software with coding agents inside a ready-to-use Dev Container, driven by a written specification and ADRs.
lang: Shell
lang_color: "#89e051"
license: MIT
# release | build-from-source | template. A GitHub template repository with tagged template
# releases (v0.9.0), checked 2026-11-10.
status: template
repo: https://github.com/hivevm/nuc
---

Coding agents write code fast. What they lose just as fast is the *why*: a structural decision made
silently in one session is forgotten in the next, the reasoning lives in a chat log nobody reads
again, and every agent follows slightly different house rules. The faster the code grows, the harder
it gets to review.

NUC is a repository template, not a tool to install, for how humans and agents decide, review and
enforce. A project starts from it inside a ready-to-use Dev Container, and the work is driven by a
written specification and Architecture Decision Records, so intent and reasoning stay explicit and
reviewable.

## What is in the nucleus

- **Dev Container.** A reproducible environment with the Claude Code extension preinstalled. It ships
  no language toolchain; a project adds the one it needs.
- **One rule file for every agent.** `AGENTS.md` and the Agent Skills are read by Claude Code, Codex,
  Gemini CLI, Cursor and others alike. Rules are never duplicated per agent.
- **`docs/SPECIFICATION.md`.** The constitution of the project: problem, goals, vocabulary and success
  criteria.
- **`docs/adr/`.** Architecture Decision Records, one per decision that is costly to reverse or
  constrains future choices.
- **Rules with teeth.** Git hooks and CI refuse what breaks the record, such as an accepted ADR no
  test cites, a broken link, a placeholder left behind, or a commit or push on `main`.

## The rules agents follow

Authority runs in one direction: **specification → accepted ADRs → task**. Every change respects
both, and a few rules keep humans in charge of the decisions that matter:

- **ADR first.** Before an architecture-relevant change, such as a new dependency, a public interface,
  a protocol or a data format, the agent writes an ADR with status `proposed`, then stops and asks for
  review.
- **Only humans accept.** Agents may propose; only a human reviewer moves an ADR to `accepted`.
  Accepted ADRs are binding and never edited: a changed decision gets a new ADR that supersedes the
  old one.
- **Small, reviewable steps.** Research before design, surface the reasoning, ask when the scope is
  unclear.

Not everything needs an ADR. Bug fixes, tests, docs and refactorings that keep public interfaces
intact just get done; the rule of thumb is whether a change locks anything in.

## Proportionate

A small project takes a short path through the setup. A complex one takes every step in full and can
grow to tickets worked by agents in parallel, each in a worktree of its own.

## Getting started

Create a repository from the [template](https://github.com/hivevm/nuc/generate), open it in VS Code
and choose **Reopen in Container**. Then work through `TEMPLATE-SETUP.md`, or ask your coding agent
to run the `setup-project` skill, which walks you through the steps one question at a time. Closing
the setup with `scripts/test-template-setup.sh --close` removes what exists only for it.

From there, write your specification, record the first decisions as ADRs, add the language toolchain
your project needs and start working with the agent.

## In HiveVM

NUC applies *model once, run anywhere* to the project itself. The specification and the ADRs are the
model of the project, what it is for and why it is built the way it is, and the agents derive the code
from it. Agents, tools and even the code can change; the written intent stays. The other HiveVM tools
and this website are built the same way.

## Why "NUC"?

In beekeeping, a *nucleus colony* is the small starter colony a full hive grows from: a queen, a few
frames of bees and brood, everything the colony needs to expand on its own. The template is the same
idea: a compact, ready-made nucleus that a complete project grows out of.
