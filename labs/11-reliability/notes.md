# Lab 11 — Reliability notes

## Concepts

| Term | Meaning |
|---|---|
| **SLI** | The signal you measure (e.g. successful HTTP probes / total) |
| **SLO** | The target on that signal (e.g. 99% over 30 days) |
| **Error budget** | `100% − SLO` — allowed unreliability before you prioritize reliability work |
| **Blameless postmortem** | Fix systems/process; assume people acted with the info they had |

Refs: [SRE — Service Level Objectives](https://sre.google/sre-book/service-level-objectives/) · [Principles of Chaos](https://principlesofchaos.org/)

## Operability checklist (kind)

1. Docker Desktop running before `kubectl` / `kind`  
2. `kubectl get po` after any host restart — don’t trust memory of “it was Healthy”  
3. Controllers (Deployment, Argo `selfHeal`) recover desired state; your job is detect + unblock  
4. FinOps lite: keep requests/limits set (Lab 06 demo already has them) so one noisy neighbor doesn’t eat the node  

## Artifacts

- `slo.md` — 99% availability for lab06-demo  
- `postmortem.md` — Docker-down + pod delete game day  
