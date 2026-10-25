# Lab 01 notes

## Image
A packaged blueprint (filesystem layers + metadata). Example: `busybox:1.36` on disk after `docker pull`. Not “running” by itself.

## Container
A running (or stopped) instance created from an image. `docker run` starts one; with `--rm` it is removed when it exits.

## pull vs run
- `docker pull` — download/store the image locally
- `docker run` — create a container from that image and start its process (`echo` in our test)

## Dockerfile (lab01-web)
- `FROM` — base image to start from (`nginx:1.27-alpine`)
- `COPY` — copy files from the build context into the image
- `-p 8080:80` — map host port 8080 → container port 80 (where nginx listens)
- Built as `lab01-web:dev`; verified with `curl http://127.0.0.1:8080/`

## Compose
- `compose.yaml` defines multiple services on one private network.
- `http://web/` works from `client` because Compose DNS resolves the **service name** `web` to that container’s IP (like a Kubernetes Service name later).
- Host still uses `localhost:8080` via the `ports` mapping; other services use the service name, not localhost.
