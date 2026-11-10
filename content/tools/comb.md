---
# The facts about a tool live here only (ADR-0008); the home page, /tools/ and the footer read them.
# Where the blog post used to be; old links redirect here.
aliases: ["/blog/introducing-comb/"]
title: "Comb"
kind: "Node editor"
role: build-on
weight: 60
tagline: "a node editor built for tens of thousands of nodes"
description: >-
  A node-editor framework for the browser, built to stay responsive with tens of thousands of nodes: it draws on a WebGL2 canvas and computes its geometry in Rust.
lang: Rust
lang_color: "#dea584"
license: MIT
# release | build-from-source | template. No GitHub release, checked 2026-11-10.
status: build-from-source
repo: https://github.com/hivevm/comb
---

Dataflow pipelines, visual programs and dependency graphs all need the same thing in the browser: an
editor in which a user creates, connects, moves and deletes nodes directly on a canvas. That works
well until the graph gets large. Then graphs get split up, simplified or shown as static pictures.
Comb is an open-source node-editor framework built to stay responsive with tens of thousands of nodes,
so that large graphs can be edited directly.

## How it stays fast

Comb spends work only on what is visible:

- **Draw only what lies on screen**, and draw like elements together.
- **Use the GPU.** Nodes, edges, connectors and edge labels are drawn on a WebGL2 canvas with PixiJS.
- **Move the heavy work out of JavaScript.** Geometry runs in a Rust engine compiled to WebAssembly.

Performance claims have to be earned by measurement. A benchmark drives a graph of 50,000 nodes and
50,000 edges in a real browser, and it decides whether an optimisation lands. The targets, on a
mid-range laptop with an integrated GPU:

- **Interaction.** Dragging, panning, zooming and editing draw a frame each refresh of a 60 Hz
  display, with a p95 frame interval of at most 16.8 ms.
- **Load.** At most one second until the first frame of that graph is drawn.
- **Size.** Under 300 kB gzipped for its JavaScript and WebAssembly, without PixiJS.

## The canvas edits, your application decides

Comb keeps to direct manipulation on the canvas. Every form for a node's attributes stays in your
application's HTML, where your own components already live. You give Comb an element to fill and the
engine's WebAssembly, then hand it the graph:

```ts
import { createComb } from "comb";
import engineUrl from "comb/engine.wasm?url";

const comb = await createComb(document.getElementById("canvas")!, {
  engine: fetch(engineUrl),
});

comb.load({
  nodes: [
    { id: "a", x: 0, y: 0, width: 220, content: [[{ kind: "text", role: "title", text: "Premium trial users" }]] },
    { id: "b", x: 320, y: 0, width: 220, content: [[{ kind: "text", role: "title", text: "Time spent listening" }]] },
  ],
  edges: [
    { id: "a-b", source: "a", target: "b", color: 0x22a55b, label: { text: "0.998", t: 0.5, offset: 0 } },
  ],
});

comb.fitView();
comb.onSelectionChange((selection) => console.log(selection)); // fill the sidebar from here
```

`onChange` reports every change to the graph, typed by its kind and by who made it, the user or the
host. Your application always knows what happened.

The boundaries are deliberate. Comb does not run the graph or store it: what a graph means and where
it lives belong to your application. It also ships no bindings for React, Vue or Svelte. It depends on
no UI framework, and its public interface is fully typed in TypeScript, so others can build such
bindings on top.

## Graph data is untrusted input

A framework that sits inside someone else's application has to behave well there:

- **No injection.** Comb never interprets graph data as HTML, script or URL. Labels are drawn as text
  only.
- **No dynamic code, no network.** It uses no `eval` and makes no network requests of its own, and is
  meant to work under a Content Security Policy that forbids `unsafe-eval`.
- **Typed refusals.** Malformed data, such as a non-finite coordinate or an edge to a missing node, is
  rejected with a typed error that says what was refused, and the graph stays as it was.

## Getting started

Comb has no tagged release yet. To try it, clone the [repository](https://github.com/hivevm/comb), open
it in its Dev Container and run `bun run example`. Add `?copies=3334` to the URL to open the example
with 50,010 nodes.

## In HiveVM

Comb is a library to build on. It follows the same principle as the rest of the family: the graph is
plain data, and everything on the canvas follows from it. It is built from a written specification
and ADRs, on the method of NUC.
