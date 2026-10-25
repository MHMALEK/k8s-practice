# Platform Engineering Learning Roadmap

End-to-end path from foundations → Kubernetes → platform engineering.  
Use with [LEARNING-GUIDE.md](LEARNING-GUIDE.md). Labs live under [`labs/`](../labs/).

**How to use this doc**

1. Work **one phase at a time**. Do not skip prerequisites.
2. For each item: learn → practice in a lab → tick the checkbox.
3. Prefer official docs and the linked free courses over random blogs.
4. Ask an agent: *“I’m on Phase N / step X — teach me the next step.”*
5. Certs are optional; hands-on labs are the real goal.

**Estimated total:** ~6–12 months at a steady pace (part-time). Adjust freely.

---

## Canonical roadmaps (external)

Bookmark these; this repo’s path is aligned with them but ordered for **platform engineering**.

| Resource | What it’s for |
|----------|----------------|
| [DevOps Roadmap (roadmap.sh)](https://roadmap.sh/devops) | Broad DevOps / SRE skill map |
| [Kubernetes docs — Tutorials](https://kubernetes.io/docs/tutorials/) | Official K8s learning |
| [CNCF Training & Certification](https://www.cncf.io/training/) | Courses + certs overview |
| [CNCF curriculum (exam topics)](https://github.com/cncf/curriculum/) | Exact topics for KCNA, CKA, CKAD, CKS, CNPA, etc. |
| [CNCF Platform Eng Maturity Model](https://tag-app-delivery.cncf.io/whitepapers/platform-eng-maturity-model/) | How real platform teams mature (people/process, not just tools) |
| [PlatformEngineering.Org University](https://university.platformengineering.org/course-1) | Platform fundamentals / IDP concepts |
| [KubeDojo](https://kube-dojo.github.io/) | Free modular cloud-native curriculum |
| [Golden Kubestronaut path](https://www.goldenkubestronaut.app/study/golden-kubestronaut-path/) | Suggested CNCF cert order |

**Free starter course:** [Introduction to Kubernetes (LF / edX)](https://www.edx.org/learn/kubernetes/the-linux-foundation-introduction-to-kubernetes) — LFS158.

**Interactive practice:** [Killercoda Kubernetes scenarios](https://killercoda.com/kubernetes) · [Kubernetes the Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way) (advanced, later).

---

## Progress tracker

Copy this into your notes or tick here as you finish phases.

| Phase | Focus | Lab folder | Status |
|-------|--------|------------|--------|
| 0 | Foundations | `labs/00-foundations` | [ ] |
| 1 | Containers | `labs/01-containers` | [ ] |
| 2 | K8s core | `labs/02-k8s-core` | [ ] |
| 3 | Config & storage | `labs/03-config-storage` | [ ] |
| 4 | Networking & packaging | `labs/04-networking-packaging` | [ ] |
| 5 | Security | `labs/05-security` | [ ] |
| 6 | GitOps | `labs/06-gitops` | [ ] |
| 7 | Observability | `labs/07-observability` | [ ] |
| 8 | IaC & cloud | `labs/08-iac-cloud` | [ ] |
| 9 | CI/CD | `labs/09-cicd` | [ ] |
| 10 | Platform / IDP | `labs/10-platform-idp` | [ ] |
| 11 | Reliability / SRE | `labs/11-reliability` | [ ] |
| Capstone | Mini platform | `labs/99-capstone` | [ ] |

---

## Phase 0 — Foundations

**Goal:** Comfortable on the CLI; you understand processes, networks, and Git.

### Learn

- [ ] Linux CLI: files, permissions, processes, systemd basics  
  → [Linux Journey](https://linuxjourney.com/) or [The Linux Command Line book](https://linuxcommand.org/tlcl.php)
- [ ] Networking: IP, DNS, ports, HTTP, TLS (conceptual)  
  → [Cloudflare Learning — Networking](https://www.cloudflare.com/learning/network-layer/what-is-a-computer-network/)
- [ ] Git: clone, branch, commit, PR, rebase vs merge  
  → [Pro Git book](https://git-scm.com/book/en/v2) (chs 1–3)
- [ ] YAML: maps, lists, multi-doc files  
  → [YAML Spec / learnxinyminutes YAML](https://learnxinyminutes.com/docs/yaml/)
- [ ] One scripting language enough to automate: Bash **or** Python

### Practice (lab)

- [ ] Create `labs/00-foundations/notes.md` with: “what is a process / port / DNS lookup”
- [ ] Script that curls a URL and checks HTTP status
- [ ] Small Git workflow: branch → commit → merge

### Exit criteria

You can explain DNS resolution and read a simple YAML file without googling every key.

---

## Phase 1 — Containers

**Goal:** Build, run, and debug container images; multi-service apps locally.

### Learn

- [ ] Images vs containers, layers, registries  
  → [Docker Get Started](https://docs.docker.com/get-started/)
- [ ] Dockerfile best practices (non-root, multi-stage)  
  → [Docker Best Practices](https://docs.docker.com/build/building/best-practices/)
- [ ] Compose for multi-service apps  
  → [Compose docs](https://docs.docker.com/compose/)
- [ ] Optional: [OCI / containerd overview](https://kubernetes.io/docs/concepts/architecture/#container-runtime)

### Practice (lab)

- [ ] Containerize a tiny API (or static site + API)
- [ ] Multi-stage build; push to a registry (Docker Hub / GHCR)
- [ ] `docker compose` with app + dependency (e.g. Redis/Postgres)

### Exit criteria

You can rebuild an image after a code change and explain why a layer was/wasn’t cached.

---

## Phase 2 — Kubernetes core

**Goal:** Local cluster; deploy, expose, update, and debug workloads.

### Learn

- [ ] Architecture: control plane, kubelet, etcd, API server  
  → [Kubernetes Components](https://kubernetes.io/docs/concepts/overview/components/)
- [ ] Declarative model & reconciliation  
  → [Objects in Kubernetes](https://kubernetes.io/docs/concepts/overview/working-with-objects/)
- [ ] Pods, ReplicaSets, Deployments, Services, Namespaces, Labels  
  → [Deploy a stateless app](https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/)
- [ ] Debug: `get`, `describe`, `logs`, `exec`, Events  
  → [Debug Running Pods](https://kubernetes.io/docs/tasks/debug/debug-application/debug-running-pod/)

### Tools

- [ ] Install [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [ ] Local cluster: [kind](https://kind.sigs.k8s.io/) **or** [k3d](https://k3d.io/) **or** [minikube](https://minikube.sigs.k8s.io/)
- [ ] Optional playground: [Killercoda](https://killercoda.com/kubernetes)

### Practice (lab)

- [ ] Create cluster; deploy Phase-1 app as Deployment (3 replicas)
- [ ] Expose with ClusterIP + port-forward; then try NodePort/LB (as available)
- [ ] Rolling update + rollback
- [ ] Break something on purpose; fix using `describe` / events / logs

### Exit criteria

You can deploy, hit the app, roll forward/back, and diagnose a CrashLoopBackOff without panic.

**Optional cert checkpoint:** [KCNA](https://www.cncf.io/training/certification/kcna/) after this phase or Phase 3.

---

## Phase 3 — Config, probes, storage, workloads

**Goal:** Configurable, healthy, stateful-aware apps.

### Learn

- [ ] ConfigMaps & Secrets  
  → [ConfigMap](https://kubernetes.io/docs/concepts/configuration/configmap/) · [Secret](https://kubernetes.io/docs/concepts/configuration/secret/)
- [ ] Probes & resources  
  → [Configure Liveness/Readiness](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) · [Resource Management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)
- [ ] Volumes, PVC, StorageClass  
  → [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
- [ ] StatefulSets, Jobs, CronJobs  
  → [StatefulSets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/) · [Jobs](https://kubernetes.io/docs/concepts/workloads/controllers/job/)

### Practice (lab)

- [ ] Externalize config; mount a Secret (local only — never commit real secrets)
- [ ] Add probes + requests/limits; watch scheduling behavior
- [ ] PVC that survives pod delete (with a simple DB or file writer)
- [ ] CronJob that writes a timestamp somewhere observable

### Exit criteria

You can explain why a pod is Pending (resources) vs CrashLooping (app/probe).

---

## Phase 4 — Networking & packaging

**Goal:** HTTP ingress with TLS mindset; repeatable app packaging.

### Learn

- [ ] Ingress vs Gateway API  
  → [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) · [Gateway API](https://gateway-api.sigs.k8s.io/)
- [ ] Ingress controller (e.g. ingress-nginx) on kind/k3d
- [ ] cert-manager concepts  
  → [cert-manager docs](https://cert-manager.io/docs/)
- [ ] Helm  
  → [Helm docs](https://helm.sh/docs/)
- [ ] Kustomize  
  → [Kustomize](https://kubectl.docs.kubernetes.io/guides/introduction/kustomize/)
- [ ] HPA + metrics-server  
  → [Horizontal Pod Autoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)

### Practice (lab)

- [ ] Install ingress controller; route host/path to your app
- [ ] Helm chart for your app (`values.yaml` for env differences)
- [ ] Same app with Kustomize overlays (`dev` / `prod` stubs)
- [ ] Enable metrics-server; demo HPA (even with synthetic load)

### Exit criteria

One change to `values.yaml` or an overlay redeploys the app correctly.

**Optional cert checkpoint:** [CKAD](https://www.cncf.io/training/certification/ckad/) leans heavily on Phases 2–4.

---

## Phase 5 — Security

**Goal:** Least privilege and workload hardening on the cluster.

### Learn

- [ ] RBAC: ServiceAccount, Role, RoleBinding, ClusterRole  
  → [Using RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
- [ ] Pod Security Standards  
  → [Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/)
- [ ] NetworkPolicies (+ CNI that enforces them, e.g. Calico/Cilium)  
  → [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [ ] Image hygiene: non-root, read-only FS, scan basics  
  → [CIS / NSA K8s hardening guides](https://www.nsa.gov/Press-Room/News-Highlights/Article/Article/2716980/nsa-cisa-release-kubernetes-hardening-guidance/) (high level)
- [ ] Secret management patterns: Sealed Secrets / External Secrets / cloud KMS (concepts first)

### Practice (lab)

- [ ] SA with minimal Role; prove a denied API call
- [ ] NetworkPolicy that blocks then allows app → DB
- [ ] Harden Deployment (non-root, drop caps) and fix breakage

### Exit criteria

You can describe who can do what in a namespace, and why a pod can’t talk to another.

**Optional:** [KCSA](https://www.cncf.io/training/certification/kcsa/) · later [CKS](https://www.cncf.io/training/certification/cks/) (after CKA).

---

## Phase 6 — GitOps

**Goal:** Cluster state matches Git; drift is visible and fixable.

### Learn

- [ ] GitOps principles  
  → [OpenGitOps](https://opengitops.dev/) · [CGOA curriculum](https://github.com/cncf/curriculum/)
- [ ] Pick one controller first: **Argo CD** *or* **Flux**  
  → [Argo CD](https://argo-cd.readthedocs.io/) · [Flux](https://fluxcd.io/flux/)
- [ ] App-of-apps / monorepo vs polyrepo patterns (concepts)
- [ ] Progressive delivery intro (Argo Rollouts / Flagger) — optional

### Practice (lab)

- [ ] Install Argo CD or Flux on local cluster
- [ ] Point it at a Git repo under this project (e.g. `labs/06-gitops/apps`)
- [ ] Change a manifest in Git → sync → verify cluster
- [ ] Introduce drift manually; watch the tool reconcile or alert

### Exit criteria

You never `kubectl apply` production-like changes except for break-glass; Git is source of truth.

**Optional certs:** [CGOA](https://www.cncf.io/training/certification/cgoa/) · [CAPA](https://www.cncf.io/training/certification/capa/) (Argo).

---

## Phase 7 — Observability

**Goal:** Metrics, logs, traces — and knowing which to use when.

### Learn

- [ ] Pillars: metrics / logs / traces  
  → [CNCF Observability](https://www.cncf.io/blog/2023/07/25/a-beginners-guide-to-the-cncf-observability-landscape/) (landscape orientation)
- [ ] Prometheus + Grafana basics  
  → [Prometheus Getting Started](https://prometheus.io/docs/prometheus/latest/getting_started/)
- [ ] OpenTelemetry concepts  
  → [OTel docs](https://opentelemetry.io/docs/)
- [ ] Kubernetes signals: metrics-server, events, container logs

### Practice (lab)

- [ ] Deploy Prometheus + Grafana (Helm) or use a lightweight stack
- [ ] Scrape your app or kube-state-metrics; build one dashboard
- [ ] Add a simple RED/USE style panel for your service
- [ ] Optional: emit one OTel trace from the app

### Exit criteria

Given “app is slow,” you know whether to look at metrics, logs, or traces first.

**Optional:** [PCA](https://www.cncf.io/training/certification/pca/) · [OTCA](https://www.cncf.io/training/certification/otca/).

---

## Phase 8 — Infrastructure as Code & cloud

**Goal:** Provision infra reproducibly; know managed K8s tradeoffs.

### Learn

- [ ] Terraform (or OpenTofu) core workflow  
  → [Terraform tutorials](https://developer.hashicorp.com/terraform/tutorials)
- [ ] Modules, state, workspaces (concepts)
- [ ] One cloud’s managed Kubernetes overview (EKS / GKE / AKS) — read, don’t rush to pay  
  → Pick docs for your cloud of choice
- [ ] When **not** to self-host control planes

### Practice (lab)

- [ ] Terraform: local or free-tier resource (e.g. VPC stub, or kind via provider — keep cost $0)
- [ ] Document a “managed K8s” mental model: node groups, IAM, LB, storage classes
- [ ] Optional: provision a cheap/dev cluster only when ready (destroy when done)

### Exit criteria

You can draw: Git → CI → IaC → cluster → GitOps → app.

---

## Phase 9 — CI/CD for platforms

**Goal:** Pipelines that build, test, scan, and update GitOps manifests.

### Learn

- [ ] Pipeline stages: build → test → scan → push → update manifest  
  → [roadmap.sh DevOps — CI/CD section](https://roadmap.sh/devops)
- [ ] GitHub Actions **or** GitLab CI **or** Tekton (pick one)
- [ ] Image tagging strategies (git sha, semver)
- [ ] Supply-chain basics: SBOM, signing (Cosign) — intro level  
  → [Sigstore](https://www.sigstore.dev/)

### Practice (lab)

- [ ] CI builds your Dockerfile and pushes an image on push to `main`
- [ ] Pipeline opens a PR or commits a tag bump in the GitOps repo
- [ ] Fail the pipeline on a trivial test or critical scan finding

### Exit criteria

Merge to app repo → new image → GitOps sync → cluster updates, with no manual `docker push` for the happy path.

---

## Phase 10 — Platform engineering & IDP

**Goal:** Think **platform as a product**: golden paths, self-service, catalogs.

### Learn (concepts first)

- [ ] What platform engineering is (vs DevOps vs SRE)  
  → [CNCF PE Maturity Model](https://tag-app-delivery.cncf.io/whitepapers/platform-eng-maturity-model/)
- [ ] Golden paths / paved roads
- [ ] Internal Developer Platform (IDP) building blocks
- [ ] [Team Topologies](https://teamtopologies.com/) — platform team interaction modes (skim)
- [ ] Backstage overview  
  → [Backstage docs](https://backstage.io/docs/overview/what-is-backstage/) · [Spotify Learn Backstage](https://backstage.spotify.com/learn/)
- [ ] Optional deeper: [Platform Engineer’s Handbook companion](https://peh-packt.platformetrics.com/) · [PE Fundamentals](https://university.platformengineering.org/course-1)

### Practice (lab)

- [ ] Write a one-pager: *who is your platform customer and what pain do you remove?*
- [ ] Create a “golden path” template: repo skeleton + Dockerfile + Helm/Kustomize + README
- [ ] Optional: stand up Backstage locally; register your lab service in the catalog
- [ ] Map your mini-platform to maturity model aspects (Investment, Adoption, Interfaces, Operations, Measurement)

### Exit criteria

You can explain an IDP without listing tools first — in terms of user journeys and golden paths.

**Optional certs:** [CNPA](https://www.cncf.io/training/certification/cnpa/) · [CBA](https://www.cncf.io/training/certification/cba/) (Backstage) · later [CNPE](https://www.cncf.io/training/certification/cnpe/).

---

## Phase 11 — Reliability & operations

**Goal:** Operate what you built: SLOs, incidents, failure practice.

### Learn

- [ ] SLIs / SLOs / error budgets (Google SRE book concepts)  
  → [SRE Book — Service Level Objectives](https://sre.google/sre-book/service-level-objectives/)
- [ ] Incident response basics & blameless postmortems
- [ ] Chaos / game days (small scale)  
  → [Principles of Chaos](https://principlesofchaos.org/)
- [ ] Cost awareness (FinOps lite): requests/limits, idle resources

### Practice (lab)

- [ ] Define one SLO for your lab app (e.g. availability or latency)
- [ ] Kill a pod / node (kind) and document recovery steps
- [ ] Write a one-page postmortem for a failure you caused in a lab

### Exit criteria

You treat the platform as something that must be operable, not just deployable.

---

## Capstone — Mini internal platform

Build a **small but complete** loop in `labs/99-capstone`:

1. Sample app + Dockerfile  
2. Local (or cheap) Kubernetes cluster  
3. Helm/Kustomize packaging  
4. GitOps continuous delivery  
5. CI that updates GitOps  
6. Basic metrics dashboard  
7. Golden-path README: “how a developer deploys a new service”  
8. Optional: Backstage catalog entry or template  

**Done means:** another engineer (or future you) can follow the golden-path doc and ship a hello-world service without asking you.

---

## Suggested weekly rhythm

| Day focus | Activity |
|-----------|----------|
| 1–2 | Read linked docs for current checklist items |
| 3–4 | Lab work with teacher-mode agent (one step at a time) |
| 5 | Notes + reflection (3–5 sentences) |
| Flex | Killercoda / quiz / optional cert practice |

---

## Certification tracks (optional)

Pick **one** primary track; don’t collect logos instead of skills.

| Track | Order | Best after |
|-------|--------|------------|
| Kubernetes admin | KCNA → **CKA** → CKS | Phases 2–5 (+ hard way optional) |
| App on K8s | KCNA → **CKAD** | Phases 2–4 |
| Platform | KCNA → **CNPA** → (CGOA / CAPA / CBA as needed) → CNPE | Phases 6–10 |
| Observability | PCA / OTCA | Phase 7 |

Always verify current exam domains in [cncf/curriculum](https://github.com/cncf/curriculum/).

---

## What *not* to do early

- Don’t start with service mesh (Istio/Linkerd) before Ingress + NetworkPolicy make sense.
- Don’t self-host production etcd/HA control planes for learning — use kind/k3d, then managed K8s.
- Don’t buy every SaaS IDP before you can articulate golden paths on paper.
- Don’t let an AI generate a full platform in one chat — it skips the learning.

---

## Next action

1. Open [`labs/00-foundations/README.md`](../labs/00-foundations/README.md).  
2. Tell your agent: *“Start Phase 0 as my teacher — one step only.”*  
3. Keep this file updated as you tick boxes.
