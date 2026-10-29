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
