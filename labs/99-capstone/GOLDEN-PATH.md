# Capstone golden path — ship a hello-world service

**Audience:** a new developer (or future you) who has Docker + `kubectl` + `kind` + `helm` installed.  
**Done means:** app Running in the cluster via GitOps, without someone else hand-holding every command.

This runbook **reuses earlier labs** — it does not reinvent them.

## 0. One-time platform bootstrap (platform engineer)

1. Start **Docker Desktop**, then create/use the practice cluster:
   ```bash
   kind create cluster --name lab02   # skip if kind-lab02 already exists
   kubectl config use-context kind-lab02
   ```
2. Install **Argo CD** (Lab 06) and apply the demo Application:
   ```bash
   kubectl apply -f labs/06-gitops/argocd/application.yaml
   # Application watches: labs/06-gitops/apps/demo → namespace lab06
   ```
3. Optional: monitoring stack from Lab 07 if you want metrics later.
4. Confirm CI exists: [`.github/workflows/ci.yml`](../../.github/workflows/ci.yml)  
   (validate → build/scan → on `main`: push GHCR + bump GitOps image).

Product framing: [platform one-pager](../10-platform-idp/platform-one-pager.md) · [maturity map](../10-platform-idp/maturity-map.md)

## 1. Day-1 developer path (use the template)

1. Copy the template:
   ```bash
   cp -R labs/10-platform-idp/golden-path /tmp/my-service
   cd /tmp/my-service
   ```
2. Replace placeholders:
   - `app/index.html` — your content  
   - `deploy/kustomize/base/deployment.yaml` — `PLACEHOLDER_ORG` / `PLACEHOLDER_APP`
3. Local sanity:
   ```bash
   docker build -t my-service:local app/
   kubectl kustomize deploy/kustomize/overlays/dev
   ```
4. Put manifests where GitOps can see them (this repo’s pattern):
   - Either evolve `labs/06-gitops/apps/demo`, **or**
   - Add a new folder + new Argo `Application` (same shape as Lab 06).

## 2. Ship via Git (no manual docker push)

1. Push a branch / merge to `main`.
2. GitHub Actions:
   - **PR:** Terraform/Helm/Kustomize/YAML validate + image build + Trivy (CRITICAL fails the job).
   - **`main`:** push `ghcr.io/<owner>/k8s-practice-demo:sha-<7>` and commit a tag bump in `labs/06-gitops/apps/demo/deployment.yaml`.
3. Watch Argo CD sync (`lab06-demo` → `Synced` / `Healthy`).
4. Verify:
   ```bash
   kubectl get po -n lab06 -l app=lab06-demo
   kubectl port-forward -n lab06 svc/lab06-demo 8080:80
   # curl localhost:8080
   ```

## 3. Operability (don’t skip)

- SLO / error budget: [../11-reliability/slo.md](../11-reliability/slo.md)
- After Docker/host restarts: check pods, not only Deployment “Available” ([postmortem](../11-reliability/postmortem.md))
- Security patterns: Lab 05 (RBAC, NetworkPolicy)
- Packaging deeper dive: Lab 04 (Helm / Kustomize)

## 4. Capstone checklist

- [ ] kind cluster up; Argo Application healthy  
- [ ] CI green on a PR  
- [ ] Merge to `main` produces a new image tag in GitOps YAML  
- [ ] Pods roll without manual `kubectl apply` of the Deployment  
- [ ] Someone else can follow **this file** alone  

## Map of the mini-platform

```text
Developer git push
    → GitHub Actions (Lab 09)
        → GHCR image :sha-…
        → bump labs/06-gitops/apps/demo
            → Argo CD (Lab 06)
                → Pods in lab06
                    → optional Prometheus (Lab 07)
Infra mindset: Terraform loop (Lab 08) builds stadium; GitOps runs the game.
```
