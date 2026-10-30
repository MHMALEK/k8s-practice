# Lab 07 notes

## Pillars
- Metrics: numbers over time (Prometheus)
- Logs: event text (`kubectl logs` → stdout/stderr on the node)
- Traces: request path across services (later)

## Logs demo (lab06)
- App writes to stdout → runtime/kubelet keep recent logs on the node
- `kubectl -n lab06 logs deploy/lab06-demo` fetches them
- After wget to the pod: nginx access lines like `GET / HTTP/1.1" 200`
- Not long-term storage — for that you’d add Loki/ELK/cloud logging later

## Stack
- Helm: `kube-prometheus-stack` in namespace `monitoring`
- Grafana admin user: `admin` / password set via values (lab local only)
- UI: `kubectl -n monitoring port-forward svc/monitoring-grafana 3000:80`

## Scrape targets (this cluster)
- Prometheus scrapes ~18 active targets
- UP examples: kubelet, kube-state-metrics, node-exporter, apiserver, coredns, grafana, prometheus itself
- Some control-plane jobs (scheduler/etcd/controller-manager/kube-proxy) may show DOWN on kind — normal for local kind
