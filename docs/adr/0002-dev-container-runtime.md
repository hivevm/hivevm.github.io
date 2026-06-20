# ADR-0002: Debian Dev Container with docker-outside-of-docker

- **Status:** 🟢 accepted
- **Date:** 2026-06-20
- **Deciders:** Maintainer
- **Note:** Records a decision already embodied in
  [`.devcontainer/devcontainer.json`](../../.devcontainer/devcontainer.json). Documented retroactively
  so the template follows its own method; accepted by the maintainer on 2026-06-20.

## Context

The template must provide a reproducible, ready-to-use environment without committing to any language
toolchain (it has to stay language-agnostic). Coding agents frequently need Docker access, and host
container engines vary (Docker, rootless Podman). We want a lightweight setup with no Dockerfile or
Compose file to maintain.

## Decision

We will base the Dev Container on `mcr.microsoft.com/devcontainers/base:debian` and provide Docker
access through the `docker-outside-of-docker` Feature with `moby: false` and `podman: false`, so the
container reuses the **host** engine instead of installing its own daemon. The base image ships no
language toolchain; each project adds its own and fills in the **Build, Test & Run** section of
[`README.md`](../../README.md).

## Alternatives considered

- **docker-in-docker** — runs a nested daemon; heavier and typically needs a privileged container.
- **Bundling a language toolchain in the base** — premature for a template meant to fit any stack.
- **No Docker access at all** — simpler, but limits what agents can build, test, and run.

## Sources / Prior art

- Dev Container Features and specification — <https://containers.dev/features>.
- `docker-outside-of-docker` Feature —
  <https://github.com/devcontainers/features/tree/main/src/docker-outside-of-docker>.

## Consequences

- Positive: small image, fast start, no daemon to manage, reuses host credentials/engine.
- Negative / trade-offs: requires a Docker- or Podman-compatible socket on the host; the container is
  not isolated from the host daemon; no toolchain works out of the box until a project adds one.
- Follow-ups: each project records its own toolchain choice (a new ADR if it constrains future
  choices) and completes the **Build, Test & Run** commands.
