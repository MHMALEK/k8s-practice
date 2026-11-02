# Postmortem — lab06 pods after Docker Desktop outage (Lab 11 game day)

**Date:** 2026-11-02  
**Severity (lab):** Medium — demo service unavailable on kind; no external users  
**Authors:** training notes (blameless)

## Summary

After Docker Desktop was stopped, `kind-lab02` API was unreachable. When Docker returned, `lab06-demo` pods were stuck in `Completed` / `Unknown` while the Deployment still reported Available. Deleting the pods let the ReplicaSet create healthy replacements (~13s to 2/2 Ready). Argo CD Application remained `Synced` / `Healthy`.

## Impact

- Namespace `lab06`: HTTP service effectively down (no Ready pods) until cleanup.
- Duration of broken pod state: from Docker restart until manual delete (~minutes of lab time).
- SLO lens: this burns availability error budget for `lab06-demo` (see `slo.md`).

## Timeline

| Time (approx) | Event |
|---|---|
| T0 | Docker daemon down → `kubectl` connection refused |
| T1 | Docker Desktop started; kind control-plane Up |
| T2 | Nodes Ready; pods still Completed/Unknown |
| T3 | `kubectl delete po -n lab06 -l app=lab06-demo` |
| T3+13s | Two new pods Running 1/1; Deployment 2/2 |

## Detection

`kubectl get po -n lab06` showed non-Ready statuses that did not match “Available=True” intuition. No Prometheus alert fired (lab has no SLO alert wired yet).

## Response

1. Start Docker Desktop  
2. Confirm `kind get clusters` / node Ready  
3. Delete failed pods; rely on Deployment controller  
4. Confirm Argo Application health  

## Root causes (systems, not people)

1. **Single host dependency:** kind nodes are Docker containers — if Docker dies, the cluster dies with it.  
2. **Stale pod objects:** after abrupt stop, kubelet/runtime left pods in terminal/weird phases; controllers did not always reconcile until delete.  
3. **Signal gap:** Deployment Available can lag or disagree with what you see after a host crash; no active probe/alert on Ready replicas.

## What went well

- Declarative desired state (Deployment + Argo) meant recovery was “delete bad pods,” not rewrite manifests.  
- Replicas=2 shortened the window once new pods scheduled.

## Action items

| Item | Owner | Status |
|---|---|---|
| Document “start Docker before any kubectl/kind work” in lab notes | learner | done in `notes.md` |
| Add a basic `readinessProbe` to `lab06-demo` (optional hardening) | learner | open |
| Prefer checking `kubectl get po` + probe, not only Deployment Available, after host restart | learner | adopted |
| Later: alert when `kube_deployment_status_replicas_available < spec` | future Lab 07 follow-up | open |
