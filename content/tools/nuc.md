---
title: "NUC"
kind: "Agent template"
weight: 30
description: "A starting point for building software with coding agents, driven by a written specification and ADRs."
---

Coding agents write code fast, and what they lose just as fast is the reasoning behind it. NUC is a
repository template, not a tool to install, for how humans and agents decide, review and enforce. A
project starts from it inside a ready-to-use Dev Container.

## What a project gets

- **One rule file for every agent.** `AGENTS.md` is read by Claude Code, Codex, Gemini CLI, Cursor
  and others alike.
- **Intent and decisions on record.** The specification is the constitution, and every structural
  choice is an ADR that a human accepts.
- **Rules with teeth.** Git hooks and CI refuse what breaks the record, such as a broken link or a
  placeholder left behind.
- **Proportionate.** A small project takes a short path through the setup, and a complex one can grow
  to tickets worked by agents in parallel.

## Using it

Create a repository from the template on GitHub, open it in VS Code and choose **Reopen in
Container**. The steps that turn the scaffold into your own project are in the repository's
`TEMPLATE-SETUP.md`.

## Why "NUC"?

In beekeeping, a *nucleus colony* is the small starter colony a full hive grows from. The template is
the same idea: a compact nucleus that a complete project grows out of.
