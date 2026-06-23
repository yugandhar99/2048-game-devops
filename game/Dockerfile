# syntax=docker/dockerfile:1.7

# Static 2048 game served by an unprivileged NGINX runtime image.
# The app remains a simple HTML/CSS/JavaScript game; this Dockerfile only
# productionizes how it is packaged and served.
FROM nginxinc/nginx-unprivileged:1.27-alpine

LABEL org.opencontainers.image.title="2048 Game - DevOps Edition" \
      org.opencontainers.image.description="Static 2048 game containerized with NGINX for Kubernetes/GitOps deployment" \
      org.opencontainers.image.source="https://github.com/yugandhar99/2048-game-devops" \
      org.opencontainers.image.licenses="MIT"

USER root
RUN rm -rf /usr/share/nginx/html/*

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html favicon.ico /usr/share/nginx/html/
COPY js/ /usr/share/nginx/html/js/
COPY style/ /usr/share/nginx/html/style/
COPY meta/ /usr/share/nginx/html/meta/

RUN chown -R nginx:nginx /usr/share/nginx/html /etc/nginx/conf.d

USER nginx
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1

CMD ["nginx", "-g", "daemon off;"]
