# Lab 06 — GitOps

**Roadmap:** [Phase 6](../../docs/ROADMAP.md#phase-6--gitops)

## Goal

Argo CD **or** Flux: Git is source of truth; drift is visible.

## Prerequisites

- Labs 02–04 packaging in Git

## Your artifacts

- `apps/` — manifests the controller syncs
- `notes.md` — sync vs drift observations

## Exit criteria

Change in Git → cluster updates; manual drift gets reconciled or flagged.

## Start with the teacher

> “I’m on Lab 06 — help me choose Argo CD vs Flux, then first install step only.”
