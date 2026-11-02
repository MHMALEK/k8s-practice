# SLO — lab06-demo

## Service

`lab06-demo` in namespace `lab06` (Argo CD Application `lab06-demo`), HTTP via ClusterIP Service port 80.

## SLI

**Availability** = count of successful probes (HTTP status &lt; 500) / total probes  
In this lab, probe with `wget`/`curl` from another pod in the cluster (same idea as a blackbox exporter later).

## SLO

**99.0%** availability over a rolling **30-day** window.

## Error budget

`100% − 99.0% = 1.0%` ≈ **7.2 hours** of downtime per 30 days.

When the budget is burned: pause “feature” experiments (new charts, random image bumps) and spend the next cycle on recovery (probes, replicas, resource requests, runbooks).

## What we will NOT promise yet

- p99 latency SLOs
- Multi-region / multi-cluster
- “Five nines” — inappropriate for kind + a single Deployment

## How we’ll notice (lab-scale)

- Deployment `Available` condition / Ready replicas &lt; desired
- Manual or CronJob probe failing
- (Later) Prometheus alert on probe failure rate
