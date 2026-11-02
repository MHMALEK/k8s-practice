# Maturity map — this training mini-platform

Aspects from the [CNCF Platform Engineering Maturity Model](https://tag-app-delivery.cncf.io/whitepapers/platform-eng-maturity-model/).  
Levels used here: **Emerging → Evolving → Scaling → Optimizing** (honest for a practice repo, not a company-wide platform).

| Aspect | Level | Evidence in this repo |
|---|---|---|
| **Investment** | Evolving | Deliberate labs for GitOps, CI, IaC, security, observability — not ad-hoc scripts only. Still “learner time,” not a funded platform team. |
| **Adoption** | Emerging | One golden path (`labs/10-platform-idp/golden-path/`) + Lab 06 demo app. No multi-team onboarding metrics yet. |
| **Interfaces** | Evolving | Git + Argo Application + GitHub Actions + template README as the “API.” No Backstage portal / ticketing self-service UI yet. |
| **Operations** | Evolving | Automated sync (`selfHeal`), CI validate/scan, NetworkPolicy/RBAC patterns from Lab 05. No on-call, SLOs, or multi-cluster ops yet. |
| **Measurement** | Emerging | One-pager lists aspirational metrics (time-to-first-sync). No dashboards of adoption or DORA-for-platform yet. |

## IDP in one sentence (exit criteria)

> An IDP is the **set of paved journeys** (create service → CI → GitOps → running pods) that app teams take by default — backed by optional catalogs/portals — not a shopping list of Argo, Backstage, and Terraform.

## Optional next (skip unless curious)

- Register the golden-path service in a local [Backstage](https://backstage.io/docs/overview/what-is-backstage/) catalog (`Component` + `Location`).
- Track one real metric: “minutes from clone golden-path → Argo Healthy.”
