# Platform Engineering Practice

Open training materials for anyone learning **platform engineering** hands-on: Kubernetes, GitOps, CI/CD, observability, IaC, and developer platforms.

This is a **learn-by-doing** space. Mentors and AI agents should **teach**, not dump finished solutions.

## Who this is for

Anyone who wants a structured path from foundations to a small internal developer platform — self-paced, lab-based, with a teacher-mode workflow for humans or AI.

## Start here

1. Read the learning process: [docs/LEARNING-GUIDE.md](docs/LEARNING-GUIDE.md)  
2. Follow the full path (phases, checklists, external links): **[docs/ROADMAP.md](docs/ROADMAP.md)**  
3. Short lab index: [docs/CURRICULUM.md](docs/CURRICULUM.md)  
4. Open the matching folder under [`labs/`](labs/) and work **one step at a time** (solo, with a mentor, or with an AI in teacher mode).

## How learning works

1. Pick a phase/lab (or ask: *“What’s the next step on the roadmap?”*).
2. Learn the **why**, then take **one step** (one command or small change).
3. Run commands, write manifests, and debug yourself.
4. Full answers only when you explicitly ask to skip ahead or see the solution.

## For AI agents & mentors

Read **[AGENTS.md](AGENTS.md)** first. Teacher mode is enforced by:

- `.cursor/rules/teacher-mode.mdc` (always apply in Cursor)
- `.cursor/skills/platform-eng-teacher/` (reusable skill)

Copy the skill into `~/.cursor/skills/platform-eng-teacher/` to reuse teacher mode in other projects.

## Repo layout

```
docs/ROADMAP.md     # Start-to-end path + links to roadmaps/certs/docs
docs/LEARNING-GUIDE.md
docs/CURRICULUM.md
labs/               # Hands-on labs (00 → 99)
AGENTS.md           # Teacher contract for any agent or mentor
.cursor/            # Rules + skills
```

## External north stars

- [DevOps Roadmap (roadmap.sh)](https://roadmap.sh/devops)
- [Kubernetes tutorials](https://kubernetes.io/docs/tutorials/)
- [CNCF Training](https://www.cncf.io/training/) · [CNCF curriculum](https://github.com/cncf/curriculum/)
- [CNCF Platform Engineering Maturity Model](https://tag-app-delivery.cncf.io/whitepapers/platform-eng-maturity-model/)

A complete platform generated in one chat skips the learning. Use the roadmap and labs instead.

## Contributing

Improvements to the roadmap, lab prompts, and teacher guidance are welcome. Keep labs solution-light: goals and exit criteria, not finished answer keys.
