traefik.enable=true
traefik.http.middlewares.gzip.compress=true
traefik.http.middlewares.redirect-to-https.redirectscheme.scheme=https

# HTTP Router
traefik.http.routers.http-0-kalu.entryPoints=http
traefik.http.routers.http-0-kalu.middlewares=redirect-to-https
traefik.http.routers.http-0-kalu.rule=Host(`kalu.cyfamod.com`) && PathPrefix(`/`)
traefik.http.routers.http-0-kalu.service=http-0-kalu

# HTTPS Router
traefik.http.routers.https-0-kalu.entryPoints=https
traefik.http.routers.https-0-kalu.middlewares=gzip
traefik.http.routers.https-0-kalu.rule=Host(`kalu.cyfamod.com`) && PathPrefix(`/`)
traefik.http.routers.https-0-kalu.service=https-0-kalu
traefik.http.routers.https-0-kalu.tls.certresolver=letsencrypt
traefik.http.routers.https-0-kalu.tls=true

# Services
traefik.http.services.http-0-kalu.loadbalancer.server.port=80
traefik.http.services.https-0-kalu.loadbalancer.server.port=80

# Caddy Configuration
caddy_0.encode=zstd gzip
caddy_0.handle_path.0_reverse_proxy={{upstreams 80}}
caddy_0.handle_path=/*
caddy_0.header=-Server
caddy_0.try_files={path} /index.html /index.php
caddy_0=https://
caddy_ingress_network=coolify





















