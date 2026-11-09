---
title: "Comb"
kind: "Node editor"
weight: 50
description: "A node-editor framework for the browser, built to stay responsive with tens of thousands of nodes."
---

Dataflow pipelines, visual programs and dependency graphs all need an editor in which a user creates,
connects, moves and deletes nodes directly on a canvas. That works well until the graph gets large.
Comb is built for web applications that edit graphs of tens of thousands of nodes.

## How it stays fast

Comb spends work only on what is visible:

- **Draw only what lies on screen**, and draw like elements together.
- **Use the GPU.** Nodes, edges, connectors and edge labels are drawn on a WebGL2 canvas with PixiJS.
- **Move the heavy work out of JavaScript.** Geometry runs in a Rust engine compiled to WebAssembly.

A benchmark with 50,000 nodes and 50,000 edges in a real browser decides whether an optimisation
lands.

## The canvas edits, your application decides

Comb keeps to direct manipulation on the canvas. Every form for a node's attributes stays in your
application's HTML, where your own components already live.
