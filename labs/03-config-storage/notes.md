# Lab 03 notes

## ConfigMap
- Non-secret config stored in the cluster (`data:` key/value)
- Decouples config from the container image
- Object: `lab03-web-config` with `APP_MESSAGE`, `APP_ENV`

## Wiring into a Pod
- `envFrom.configMapRef` on the container → every ConfigMap key becomes an env var
- Verified: `kubectl exec … -- printenv APP_MESSAGE` → `hello from ConfigMap`
- Note: env vars are set at container **start**; changing the ConfigMap later needs a Pod restart to pick up new values

## Persistent storage (PVC)
- PVC `lab03-data` requests 100Mi; kind `standard` StorageClass provisioned a PV
- Deployment mounts PVC at `/data` via `volumes` + `volumeMounts`
- Wrote `/data/hello.txt`, deleted Pod, new Pod still had the same file
- Deleting the **Pod** keeps data; deleting the **PVC** can delete data (reclaim policy Delete)

## Probes (lab03-web)
- Readiness: HTTP GET `/` on port 80 — fail → leave Service endpoints
- Liveness: HTTP GET `/` on port 80 — fail → restart container
- `initialDelaySeconds` / `periodSeconds` control when/how often checks run

## Resources (lab03-web)
- requests: cpu 50m, memory 64Mi — scheduler placement
- limits: cpu 200m, memory 128Mi — cap (CPU throttle / memory OOM if exceeded)
- Units: `m` = millicores (1000m = 1 CPU); `Mi` = mebibytes
