# Cantina web — Godot HTML5 export served by nginx
FROM nginx:1.31-alpine

# Custom nginx config for Godot web export
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Web build files
COPY code/ /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost/ > /dev/null 2>&1 || exit 1
