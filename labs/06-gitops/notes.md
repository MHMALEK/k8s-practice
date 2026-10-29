# Lab 06 notes

## GitOps idea
- Git = desired state; controller syncs the cluster to match
- Hand `kubectl apply` is break-glass; day-to-day changes go through Git

## Argo CD install
- Namespace: `argocd`
- Installed via official `stable/manifests/install.yaml`
- Core pods Ready: server, repo-server, application-controller, redis, …
- UI (local): `kubectl -n argocd port-forward svc/argocd-server 8080:443`
- Login user: `admin`; password from secret `argocd-initial-admin-secret` (do not commit)
- Note: ApplicationSet CRD apply may fail on annotation size; plain `Application` CRD is enough for this lab
- Next: Application pointing at this repo's manifests + sync

## Application lab06-demo
- Source: `https://github.com/MHMALEK/k8s-practice.git` path `labs/06-gitops/apps/demo`
- Destination: namespace `lab06` (auto-created)
- Sync: automated + prune + selfHeal
- Result: Synced/Healthy → Deployment+Service, 2 replicas
- Drift test: `kubectl scale … --replicas=1` → Argo restored to 2 from Git
