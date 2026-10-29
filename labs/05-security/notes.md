# Lab 05 notes

## RBAC
- ServiceAccount = identity for Pods / impersonation tests
- Role = permissions in one namespace (verbs + resources)
- RoleBinding = attaches Role to a subject (SA/user/group)
- `lab05-reader`: can get/list/watch pods; cannot delete pods

## NetworkPolicy
- RBAC = API access; NetworkPolicy = Pod network access
- kindnet does not enforce policies → installed Calico, removed kindnet
- Policy on `lab05-api`: ingress only from Pods with `access: granted` to port 80
- Demo: unlabeled client → wget timeout; `access=granted` → nginx HTML

## 3-tier NetworkPolicies
- Manifest: `networkpolicy-3tier.yaml` (frontend → api → db)
- Baseline: `lab05-tier-deny-ingress` denies all ingress to `tier in (frontend,api,db)`
- Allows: anyone→frontend; frontend→api; api→db
- Verified: frontend→api OK; api→db OK; frontend→db BLOCKED; random→api BLOCKED; random→frontend OK
- Grant access = match `from.podSelector` (here `tier: frontend` or `tier: api`), not RBAC

## Pod hardening (lab05-hardened)
- `runAsNonRoot` + `runAsUser: 101` (verified `id` → uid=101)
- `allowPrivilegeEscalation: false`, `capabilities.drop: [ALL]`
- `readOnlyRootFilesystem: true` + emptyDir mounts for /tmp, cache, run
- Image: `nginxinc/nginx-unprivileged` (listens on 8080 without root)
