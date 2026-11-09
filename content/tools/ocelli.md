---
title: "Ocelli"
kind: "Git client"
weight: 40
screenshots:
  - src: /assets/tools/ocelli/desktop.png
    width: 2880
    height: 1720
    alt: "Ocelli desktop application with a sidebar, the commit graph and the details of a commit"
    caption: "The desktop application: sidebar, commit graph and commit details."
  - src: /assets/tools/ocelli/cli.png
    width: 3134
    height: 1388
    alt: "Ocelli in the terminal, showing the same layout drawn with box-drawing characters"
    caption: "The terminal application: the same layout, drawn with box-drawing characters."
description: "Views and edits Git repositories through a readable commit graph, on the desktop and in the terminal."
---

Git history is a directed acyclic graph, but the usual tools flatten it into a list or draw it as
ASCII art that becomes unreadable once several branches run in parallel. Ocelli starts from the graph,
and the repository can be edited from it too.

## A graph that stays readable

Time runs downwards, each branch keeps its own lane, and merges are drawn as unambiguous orthogonal
edges:

```text
 ● abc1234   main   Fix login bug                    Alice      2024-01-12 14:30
 ●─┐ def567         Merge feature/oauth into main    Bob        2024-01-11 09:15
 │ ● ghi890  feat   Add OAuth2 support               Carol      2024-01-10 17:42
 │ ● jkl012         Refactor auth module             Carol      2024-01-09 11:20
 ●─┘ mno345         Update dependencies              Alice      2024-01-08 16:05
 ● pqr678           Initial commit                   Dave       2024-01-01 10:00
```

Around the graph come a repository sidebar, commit details, search and a highlight of a commit's
ancestors and descendants. Only visible rows are painted, and history loads off the UI thread, which
keeps large repositories responsive.

## Why "Ocelli"?

Ocelli are the three simple eyes on top of a bee's head, with which it reads light and the horizon at
a glance. The tool gives a repository the same: one view of the shape of the whole history.
