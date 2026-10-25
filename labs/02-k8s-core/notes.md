# Lab 02 notes

## Cluster / context / node / pod
- Cluster: the whole Kubernetes system
- Context: kubectl’s pointer to which cluster (+ user) to talk to
- Node: a VM (or kind’s fake VM) that runs many Pods
- Pod: one app instance (one or more containers) scheduled onto a node

## Deployment lab02-web
- Desired state: 3 replicas of nginx
- Pods are ephemeral; Deployment keeps the count at 3

## Service lab02-web
- 1 Service object → fronts all Pods with label `app=lab02-web`
- ClusterIP (e.g. 10.96.x.x) + DNS name `lab02-web` inside the cluster
- Endpoints = the 3 Pod IPs:ports
- `curl http://lab02-web/` from another Pod returns nginx HTML

## Rolling update / rollback
- `kubectl set image deploy/lab02-web web=nginx:1.27` → new revision, Pods replaced gradually
- `kubectl rollout undo deploy/lab02-web` → back to previous ReplicaSet / image
- Prefer changing the YAML + `kubectl apply` so Git and cluster stay in sync
- Service keeps working during the rollout (same labels)
