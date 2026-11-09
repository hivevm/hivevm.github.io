---
title: "Nectar"
kind: "Documentation generator"
weight: 20
description: "Turns one Markdown source into a website and a PDF from the same engine."
---

Projects like to keep their documentation as Markdown next to the code, and readers want it in two
forms: a website to read and link, and a PDF to hand out or archive. Nectar is one engine for both,
written in Rust, so the two outputs come from the same document model and do not drift apart.

## Using it

A single Markdown file needs no configuration at all. This writes `notes.pdf` next to the file:

```bash
nectar build notes.md
```

A full project is a directory with a `nectar.toml`. There, `nectar build` writes the site, and
`nectar serve` serves it on your machine and reloads the browser on every change.

## What it handles

Besides the website and the PDF, Nectar can write an EPUB on request. It highlights code with
TextMate grammars and draws railroad, Graphviz and PlantUML diagrams.
