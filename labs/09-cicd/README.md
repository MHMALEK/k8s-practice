# Lab 09 — CI/CD

**Roadmap:** [Phase 9](../../docs/ROADMAP.md#phase-9--cicd-for-platforms)

## Goal

Build → test → scan → push image → update GitOps manifests.

## Prerequisites

- Lab 06 GitOps loop working (or ready to wire)

## Your artifacts

- `.github/workflows/` or `.gitlab-ci.yml` (your choice)
- `notes.md`

## Exit criteria

Merge → new image → GitOps sync → cluster updates without manual docker push.

## Start with the teacher

> “I’m on Lab 09 — pick a CI system with me, then first pipeline step only.”
