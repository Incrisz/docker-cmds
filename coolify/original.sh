traefik.enable=true
traefik.http.middlewares.gzip.compress=true
traefik.http.middlewares.redirect-to-https.redirectscheme.scheme=https
traefik.http.routers.http-0-joskow0g844swsow4o080w08.entryPoints=http
traefik.http.routers.http-0-joskow0g844swsow4o080w08.middlewares=redirect-to-https
traefik.http.routers.http-0-joskow0g844swsow4o080w08.rule=Host(`mum.cyfamod.com`) && PathPrefix(`/`)
traefik.http.routers.http-0-joskow0g844swsow4o080w08.service=http-0-joskow0g844swsow4o080w08
traefik.http.routers.https-0-joskow0g844swsow4o080w08.entryPoints=https
traefik.http.routers.https-0-joskow0g844swsow4o080w08.middlewares=gzip
traefik.http.routers.https-0-joskow0g844swsow4o080w08.rule=Host(`mum.cyfamod.com`) && PathPrefix(`/`)
traefik.http.routers.https-0-joskow0g844swsow4o080w08.service=https-0-joskow0g844swsow4o080w08
traefik.http.routers.https-0-joskow0g844swsow4o080w08.tls.certresolver=letsencrypt
traefik.http.routers.https-0-joskow0g844swsow4o080w08.tls=true
traefik.http.services.http-0-joskow0g844swsow4o080w08.loadbalancer.server.port=80
traefik.http.services.https-0-joskow0g844swsow4o080w08.loadbalancer.server.port=80

caddy_0.encode=zstd gzip
caddy_0.handle_path.0_reverse_proxy={{upstreams 80}}
caddy_0.handle_path=/*
caddy_0.header=-Server
caddy_0.try_files={path} /index.html /index.php
caddy_0=https://mum.cyfamod.com











# Add the following lines for Caddy to generate SSL certificates
caddy_0.tls {
    on_demand
}
