# Lab 08 — IaC & Managed Kubernetes Notes

## 1. Terraform / OpenTofu Core Loop

1. `terraform init` — download provider plugins (`.terraform/`, `.terraform.lock.hcl`).
2. `terraform plan` — compare **desired config** (`.tf`) vs **recorded state** (`terraform.tfstate`) + live API refresh; dry-run only.
3. `terraform apply` — execute the plan and write new state.
4. **Drift** — if someone changes reality outside Terraform, the next `plan`/`apply` reconciles back to `.tf`.
5. `terraform destroy` — tear down every resource tracked in state.

> **Never commit `terraform.tfstate` to Git.** In real cloud setups, state contains sensitive values and lives in a remote backend (S3 + DynamoDB lock, GCS, Terraform Cloud, etc.).

## 2. Variables, Outputs, Modules

- **`variable`** — parameterize configs (e.g. `environment = "dev" | "staging" | "prod"`).
- **`output`** — export values (cluster endpoint, VPC ID, IAM role ARN) for operators or downstream tooling.
- **`module`** — reusable folder of `.tf` files called with different inputs per environment.

## 3. Managed Kubernetes (GKE / EKS / AKS) Mental Model

| Layer | Cloud Provider Owns | Platform Team Owns |
|---|---|---|
| **Control plane** (`kube-apiserver`, `etcd`, scheduler, controller-manager) | Runs, patches, backs up, multi-AZ HA | Version upgrades, API access controls |
| **Worker nodes** (Node Pools / Node Groups) | VM lifecycle APIs & node images | Instance sizing, min/max scaling (Cluster Autoscaler / Karpenter), spot vs on-demand |
| **Networking & LB** | VPC, cloud Load Balancers | Subnets, CNI choice, `Ingress` / `Gateway` → cloud LB, `NetworkPolicy` |
| **Storage** | Block/file storage service (EBS, Persistent Disk, Azure Disk) | `StorageClass`, PVCs, backup/retention policies |
| **Identity (IAM ↔ K8s)** | Cloud IAM + OIDC federation | Mapping K8s `ServiceAccount` → cloud IAM role (Workload Identity / IRSA) |
| **Workloads & cluster add-ons** | Nothing | GitOps (Argo CD / Flux), Prometheus, policies, app manifests |

## 4. End-to-End Platform Flow (Exit Criteria)

```text
Developer / Platform Engineer
        │
        ▼
    Git Push
        │
        ├──► [Infra Pipeline (CI)]
        │         │
        │         ▼
        │    Terraform Plan / Apply
        │         │
        │         ▼
        │    Cloud Infra (VPC, IAM, Managed K8s Cluster, Node Pools)
        │         │
        │         └──► Bootstraps Argo CD on Cluster
        │
        └──► [App / Config Pipeline (CI)]
                  │
                  ▼
             Build + Test + Scan Image ──► Push to Registry (tag = git SHA)
                  │
                  ▼
             Update GitOps Manifest (apps/demo/deployment.yaml)
                  │
                  ▼
             Argo CD Detects Git Change ──► Syncs to Cluster ──► Running Pods
```

**Boundary rule:** Terraform builds the **stadium** (cloud + cluster + bootstrap). GitOps runs the **games** inside it (workloads, configs, day-2 app releases).
