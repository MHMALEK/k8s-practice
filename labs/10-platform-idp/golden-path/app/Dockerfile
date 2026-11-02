FROM nginxinc/nginx-unprivileged:1.27-alpine
USER root
RUN apk upgrade --no-cache
USER nginx
COPY index.html /usr/share/nginx/html/index.html
