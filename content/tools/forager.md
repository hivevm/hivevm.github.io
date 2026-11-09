---
title: "Forager"
kind: "Map renderer"
weight: 60
description: "Renders maps with the styling semantics of UMN MapServer, in the browser and on the server."
---

Teams that maintain their cartography as UMN MapServer mapfiles can render it only on a server, because
MapServer does not run in a browser. Forager reads mapfiles and rasterizes them itself, in the browser
as WebAssembly and on the server as a Rust library.

## From a mapfile to pixels

The mapfile frontend translates a mapfile at load time into a style IR, an intermediate representation
free of MapServer syntax. The core only ever sees that IR, and renders it without I/O or C code.

Each diagnostic names its file, line and column, so you can see exactly what a mapfile loses and why:

```console
$ forager read crates/cli/tests/fixtures/world.map --format yaml
world.map:11:3: warning [discarded-keyword]: WEB is out of Forager's scope and is discarded
layers/countries.inc:6:3: warning [unsupported-keyword]: LABELITEM is not yet supported and is ignored
```
