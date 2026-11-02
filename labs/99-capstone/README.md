# Capstone — Mini internal platform

**Roadmap:** [Capstone](../../docs/ROADMAP.md#capstone--mini-internal-platform)

## Goal

Wire a small but complete platform loop:

1. Sample app + Dockerfile  
2. Local (or cheap) Kubernetes  
3. Helm/Kustomize  
4. GitOps CD  
5. CI that bumps GitOps  
6. Basic metrics  
7. Golden-path doc for “how a dev ships a service”  
8. Optional: Backstage entry/template  

## Done means

Someone else (or future you) follows your golden-path doc and ships hello-world without asking you.

## Artifacts in this folder

- [GOLDEN-PATH.md](./GOLDEN-PATH.md) — day-1 runbook wiring Labs 04–11
- [METRICS.md](./METRICS.md) — reuse Lab 07 for basic signals / SLO tie-in

## Remaining proof (optional)

Push `main` so GitHub Actions runs validate → build/scan → GitOps image bump end-to-end.

## Start with the teacher

> “Capstone — help me inventory what I already have from earlier labs, then the first gap only.”
