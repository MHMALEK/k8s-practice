# Golden path — web service on Kubernetes

**Who this is for:** app teams that want a default path from repo → image → GitOps → cluster.

**What this is not:** every possible stack. One paved road for a simple HTTP service.

## Journey (what “done” looks like)

1. Copy this folder into a new app repo (or start from it).
2. Replace `PLACEHOLDER` names and `index.html`.
3. Push → CI builds `ghcr.io/<org>/<app>:sha-<short>` and scans.
4. CI bumps `deploy/kustomize/base/deployment.yaml` image tag (or opens a PR).
5. Argo CD Application points at `deploy/` → sync → pods Ready.

```text
Developer
  └─ git push
       ├─ CI: validate → build → scan → push image
       └─ GitOps manifest tag bump
            └─ Argo CD sync → Service / Deployment in namespace
```

## Layout

| Path | Purpose |
|---|---|
| `app/` | Dockerfile + static content (swap for your real app) |
| `deploy/kustomize/base/` | Default Deployment + Service |
| `deploy/kustomize/overlays/dev/` | Dev replicas / name prefix |

## Local checks (before you push)

```bash
docker build -t my-service:local app/
kubectl kustomize deploy/kustomize/overlays/dev
```

## How to ask the platform team

Use this path first. Open an exception ticket only if you need something **off** the golden path (custom ingress class, privileged pods, non-HTTP workloads).
