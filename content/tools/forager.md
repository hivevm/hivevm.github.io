---
# The facts about a tool live here only (ADR-0008); the home page, /tools/ and the footer read them.
# Where the blog post used to be; old links redirect here.
aliases: ["/blog/introducing-forager/"]
title: "Forager"
kind: "Map renderer"
role: derive
weight: 30
tagline: "map once, render anywhere"
description: >-
  A MapServer-compatible render core in Rust that renders existing mapfiles in the browser as WebAssembly and on the server as a library.
lang: Rust
lang_color: "#dea584"
license: MIT OR Apache-2.0
# release | build-from-source | template. No GitHub release, checked 2026-11-10.
status: build-from-source
repo: https://github.com/hivevm/forager
# Shown under "In action" on the home page: the model on the left, what follows from it on the right.
# The mapfile is crates/cli/tests/fixtures/world.map in the repository.
example:
  model:
    file: world.map
    lang: text
    code: |
      MAP
        NAME "world"
        EXTENT -180 -90 180 90
        SIZE 400 200
        IMAGECOLOR "#ffffff"
        PROJECTION
          "proj=longlat"
          "datum=WGS84"
        END
        WEB
          METADATA
            "wms_title" "World"
          END
        END
        INCLUDE "layers/countries.inc"
      END
  result:
    file: terminal
    lang: console
    code: |
      $ forager read world.map --format yaml
      world.map:11:3: warning [discarded-keyword]: WEB is out of Forager's scope and is discarded
      layers/countries.inc:6:3: warning [unsupported-keyword]: LABELITEM is not yet supported and is ignored
      version: "1.0"
      map:
        name: world
        …
---

Teams that maintain their cartography as UMN MapServer mapfiles can render it only on a server.
MapServer is a C program bound to CGI or FastCGI and to C libraries, and it does not run in a browser.

To show the same maps on the client, those teams have two options. They can render raster tiles on
the server, which costs capacity and round-trips and leaves the client unable to restyle or label per
viewport. Or they can rewrite the styling by hand for a web renderer, which loses MapServer's semantics
and doubles the maintenance. Forager takes a third path: it reads mapfiles and rasterizes them itself,
in the browser as WebAssembly and on the server as a Rust library, with the styling semantics of
MapServer.

## From a mapfile to pixels

The mapfile frontend translates a mapfile at load time into a style IR, an intermediate representation
free of MapServer syntax. The core only ever sees that IR, and renders it without I/O or C code. You
can inspect the translation yourself:

```console
$ forager read crates/cli/tests/fixtures/world.map --format yaml
world.map:11:3: warning [discarded-keyword]: WEB is out of Forager's scope and is discarded
layers/countries.inc:6:3: warning [unsupported-keyword]: LABELITEM is not yet supported and is ignored
version: "1.0"
map:
  name: world
  …
```

Each diagnostic names its file, line and column, so you can see exactly what a mapfile loses and why.
Rendering binds a layer's data to it by name:

```console
$ forager render crates/cli/tests/fixtures/square.map \
    --source areas=crates/cli/tests/fixtures/areas.geojson -o square.png
```

## In the browser

The WebAssembly bundle takes the mapfile text and a JSON object from layer name to GeoJSON, and
returns the image's RGBA pixels along with its diagnostics:

```js
render(mapfile, sources, width, height, extent);
```

The browser example shows what the engine draws: classes picked by expression, scale ranges, symbols
along lines, dashes, hatches, opacity, and labels that the label cache places by priority. You can
edit the mapfile or the GeoJSON and render again, and a [Leaflet](https://leafletjs.com/) map pans and
zooms over the same map, with every tile rendered by Forager for its extent.

## Measured against MapServer

MapServer stays in the picture as the semantic reference and the test oracle. Forager tests itself
against msautotest, MapServer's own test suite, and aims not to lose ground from one release to the
next. Fidelity is a tolerance: pixel-identical output is explicitly not a goal.

Several other properties follow from running inside a browser:

- **Portability.** Every core crate builds for `wasm32-unknown-unknown` and links no C code.
- **Determinism.** The same input should yield bit-identical RGBA buffers on every target.
- **Robustness.** Invalid geometries and broken files become diagnostics, because a panic in the
  browser loses the whole map. A weekly fuzz run checks the parser, the loader and the renderer.
- **Size.** The gzipped `.wasm` stays under 3 MB, and CI fails above it.
- **Containment.** Includes, symbol sets, font sets and other paths resolve only inside the base the
  host gives, and a path that tries to escape it becomes a diagnostic.
- **Confidentiality.** The browser bindings reject a source reference that carries a credential.

## What it leaves out

Forager replaces MapServer's rendering path, not all of MapServer. Data queries, CGI and FastCGI,
MapScript, OGC services such as WMS and WFS, and vector output are out of scope. The core also ships
no EPSG database beyond a few built-in codes, so a host passes in what else it needs.

## Getting started

Forager has no tagged release yet. To try it, clone the [repository](https://github.com/hivevm/forager)
and run the browser example:

```bash
bash scripts/build-web.sh
cargo run -p forager-dev-server
```

Then open <http://127.0.0.1:8000/>.

## In HiveVM

*Map once, render anywhere* is HiveVM's idea applied to cartography: the mapfile is the model, and the
same model renders in the browser and on the server. It is built from a written specification and
ADRs, on the method of NUC.

## Why "Forager"?

Foragers are the bees that fly out to find food and bring back where it lies, as a direction and a
distance the other bees can read. Forager does the same for maps: it takes the cartography a team
keeps in mapfiles and renders it wherever it is needed, in the browser and on the server.
*[TODO: draft, awaiting approval]*
