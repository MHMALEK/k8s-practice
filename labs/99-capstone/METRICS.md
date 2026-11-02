# Capstone — basic metrics (gap 6)

Reuse **Lab 07** rather than installing a second stack.

## What “good enough” means

| Signal | Where | Why |
|---|---|---|
| Pod/container CPU & memory | metrics-server → `kubectl top` / HPA | Capacity & autoscaling |
| App / cluster metrics | Prometheus (Lab 07) | SLI raw data |
| Deployment Available replicas | `kube_deployment_status_replicas_available` (kube-state-metrics if installed) | Ties to Lab 11 SLO |

## Minimal verification (local)

```bash
kubectl config use-context kind-lab02
kubectl top pods -n lab06 2>/dev/null || echo "metrics-server missing — reinstall from Lab 07 notes"
# If Prometheus is up (Lab 07):
# kubectl port-forward -n monitoring svc/prometheus-operated 9090:9090
# Query idea: up{namespace="lab06"} or probe success ratio once blackbox exists
```

## Tie to reliability

- Capstone SLO for the demo app: [../11-reliability/slo.md](../11-reliability/slo.md)
- After incidents, check metrics *and* `kubectl get po` ([postmortem](../11-reliability/postmortem.md))

## Optional stretch

- One Grafana dashboard row: Ready replicas + request rate for `lab06`
- Alert when Available replicas &lt; desired for &gt; 5m
