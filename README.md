# Platform Engineering Practice

Personal training repo for learning **platform engineering** hands-on: Kubernetes, GitOps, CI/CD, observability, IaC, and developer platforms.

This is a **learn-by-doing** space. Agents and collaborators must **teach**, not dump finished solutions.

## Start here

1. Read the learning process: [docs/LEARNING-GUIDE.md](docs/LEARNING-GUIDE.md)  
2. Follow the full path (phases, checklists, external links): **[docs/ROADMAP.md](docs/ROADMAP.md)**  
3. Short lab index: [docs/CURRICULUM.md](docs/CURRICULUM.md)  
4. Open the matching folder under [`labs/`](labs/) and ask an agent to teach **one step**.

## How learning works

1. Pick a phase/lab (or ask: *“What’s my next step on the roadmap?”*).
2. The agent explains the **why**, then guides **one step at a time**.
3. You run commands, write manifests, and debug yourself.
4. Full answers only when you say *“just give me the answer”* or *“skip ahead”*.

## For AI agents

Read **[AGENTS.md](AGENTS.md)** first. Teacher mode is enforced by:

- `.cursor/rules/teacher-mode.mdc` (always apply)
- `.cursor/skills/platform-eng-teacher/` (reusable skill)

To reuse teacher mode in other chats/projects, copy the skill to `~/.cursor/skills/platform-eng-teacher/` and point at this roadmap.

## Repo layout

```
docs/ROADMAP.md     # Start-to-end path + links to roadmaps/certs/docs
docs/LEARNING-GUIDE.md
docs/CURRICULUM.md
labs/               # Your hands-on work (00 → 99)
AGENTS.md           # Teacher contract for any agent
.cursor/            # Rules + skills
```

## External north stars

- [DevOps Roadmap (roadmap.sh)](https://roadmap.sh/devops)
- [Kubernetes tutorials](https://kubernetes.io/docs/tutorials/)
- [CNCF Training](https://www.cncf.io/training/) · [CNCF curriculum](https://github.com/cncf/curriculum/)
- [CNCF Platform Engineering Maturity Model](https://tag-app-delivery.cncf.io/whitepapers/platform-eng-maturity-model/)

Do **not** expect a complete platform generated in one chat. That defeats the point.
