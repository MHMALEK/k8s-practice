# Platform one-pager — mini practice platform

> Product framing: an IDP is **user journeys + golden paths**, not a tool bingo card.
> Refs: [CNCF Platform Engineering Maturity Model](https://tag-app-delivery.cncf.io/whitepapers/platform-eng-maturity-model/) · [Team Topologies](https://teamtopologies.com/)

## Customer

**Primary:** application developers who need to ship a web service to Kubernetes without becoming full-time cluster operators.

**Secondary:** platform learners / platform engineers practicing the paved road themselves.

## Jobs to be done

1. “I have a containerized app — get it running in a cluster the same way every time.”
2. “I want CI to catch broken manifests and bad images before Argo syncs.”
3. “I want a default security + observability baseline without inventing it per team.”

## Pain we remove

| Without a platform | With this golden path |
|---|---|
| Copy-paste YAML from Slack | Template repo: Dockerfile + Helm/Kustomize + README |
| Manual `docker push` + edit Deployment by hand | CI: build → scan → push → bump GitOps tag |
| “Works on my kind, fails in prod” | Same GitOps path (`labs/06-gitops`) for every env overlay |
| Every team reinvents RBAC / NetworkPolicy | Shared patterns from Lab 05 (+ optional policies later) |

## What we deliberately do **not** own (yet)

- Writing business application code
- Guaranteeing cloud spend (IaC stays $0 in this training path)
- Being a helpdesk for every framework — we offer **one** paved web-service path first

## Success metrics (Measurement aspect)

- Time from empty repo → first successful Argo sync (**target:** &lt; 1 day for a new teammate following the golden path)
- % of services using the template (Adoption)
- CI failure rate that blocks bad deploys (Operations)

## Interaction mode (Team Topologies)

**Platform as a product** with **X-as-a-Service**: teams pull the golden path; platform team responds to tickets for exceptions, not for every deploy.
