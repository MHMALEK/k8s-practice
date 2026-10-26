# Lab 04 notes

## Ingress controller
- Ingress is only rules; the **controller** (ingress-nginx) implements them
- Installed via kind example manifest into namespace `ingress-nginx`

## Ingress object (lab04-web)
- `ingressClassName: nginx` → handled by ingress-nginx
- Path `/` → Service `lab02-web:80` → Deployment Pods
- On kind, LoadBalancer EXTERNAL-IP stays pending; test with:
  `kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 8080:80`
  then `curl http://127.0.0.1:8080/`

## Helm
- Chart scaffold: `labs/04-networking-packaging/lab04-web/` (`helm create lab04-web`)
- `Chart.yaml` = chart metadata; `values.yaml` = defaults you override
- `templates/` = Go-templated Kubernetes manifests
- `helm template ./lab04-web` renders YAML without installing
- Installed: `helm upgrade --install lab04-web ./lab04-web`
- Values: `image.tag=1.27-alpine`, `replicaCount=3`
- Release tracked by Helm (`helm list`); changing values + upgrade updates the cluster
- `--set replicaCount=3` overrides for one upgrade; prefer editing `values.yaml` so Git matches the cluster

## Kustomize
- `kustomize/base` = shared Deployment + Service (plain YAML)
- `overlays/dev` → replicas 1; `overlays/prod` → replicas 3 (same base, different patches)
- Apply: `kubectl apply -k …/overlays/dev` (applied on kind)
- Helm = templates + values; Kustomize = plain YAML + overlays — both solve env differences

## HPA
- metrics-server installed (kind needs `--kubelet-insecure-tls`)
- HPA `lab04-kustomize`: min 1, max 5, target 50% CPU utilization
- Deployment needs CPU **requests** so utilization % is meaningful
- Scales Pods only — not nodes (cluster autoscaler is separate, cloud)
