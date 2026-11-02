# Lab 09 — CI/CD for platforms

## Pipeline stages

```text
push / PR
  │
  ├─ validate ── terraform fmt/validate + helm lint/template + kustomize + YAML parse
  │
  └─ build-and-scan
        │
        ├─ docker build  (tag = sha-<short-sha>)
        ├─ trivy scan    (fail on CRITICAL)
        ├─ docker push   (main only → ghcr.io)
        └─ gitops bump   (main only → edit labs/06-gitops/apps/demo/deployment.yaml)
              │
              ▼
         Argo CD selfHeal syncs new image → pods roll
```

## Why git SHA tags, not `:latest`

| Tag | Mutable? | GitOps can detect change? | Rollback |
|---|---|---|---|
| `:latest` | Yes | Often no (same string) | Hard |
| `sha-a1b2c3d` | No | Yes (string changed) | Checkout old commit / retag |

## Supply-chain intro

- **Scan** (Trivy): catch known CVEs before push.
- **SBOM / Cosign** (optional next): attest what’s in the image and who signed it → [Sigstore](https://www.sigstore.dev/).

## Exit criteria

Merge to `main` → new image in GHCR → GitOps manifest tag bump → Argo CD sync → cluster updated **without** a manual `docker push`.
