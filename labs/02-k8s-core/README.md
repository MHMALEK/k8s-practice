# Lab 02 — Kubernetes core

**Roadmap:** [Phase 2](../../docs/ROADMAP.md#phase-2--kubernetes-core)

## Goal

Run a local cluster; deploy, expose, update, and debug a workload.

## Prerequisites

- Lab 01 (containerized app)
- kubectl + kind **or** k3d **or** minikube

## Your artifacts

- `manifests/` — Deployment, Service, etc. (you write these)
- `notes.md` — debugging commands that saved you

## Exit criteria

Deploy → hit app → roll forward/back → fix CrashLoopBackOff using describe/logs/events.

## Start with the teacher

> “I’m on Lab 02 — help me pick a local cluster tool, one step at a time.”
