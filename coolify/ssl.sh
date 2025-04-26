traefik.enable=true
traefik.http.middlewares.gzip.compress=true
traefik.http.middlewares.redirect-to-https.redirectscheme.scheme=https

# HTTP Router
traefik.http.routers.http-0-kalu.entryPoints=http
traefik.http.routers.http-0-kalu.middlewares=redirect-to-https
traefik.http.routers.http-0-kalu.rule=Host(`kalu.cyfamod.com`)
traefik.http.routers.http-0-kalu.service=http-0-kalu

# HTTPS Router
traefik.http.routers.https-0-kalu.entryPoints=https
traefik.http.routers.https-0-kalu.middlewares=gzip
traefik.http.routers.https-0-kalu.rule=Host(`kalu.cyfamod.com`)
traefik.http.routers.https-0-kalu.service=https-0-kalu
traefik.http.routers.https-0-kalu.tls=true
traefik.http.routers.https-0-kalu.tls.certresolver=letsencrypt

# Services
traefik.http.services.http-0-kalu.loadbalancer.server.port=80
traefik.http.services.https-0-kalu.loadbalancer.server.port=80


# Caddy Configuration
caddy_0 {
    # Automatically handle HTTPS for this domain
    handle_path / {
        reverse_proxy {{upstreams 80}}  # This is where your backend service runs
    }
    
    encode zstd gzip
    header -Server  # Hide Caddy version in response headers

    # Handle file requests, fallback to index.html for SPA
    try_files {path} /index.html /index.php
}
