# Create a private key for your CA
openssl genpkey -algorithm RSA -out ca.key

# Create a CA certificate
openssl req -x509 -new -key ca.key -out ca.crt -days 3650 -subj "/CN=My CA"

# Create a private key for the server
openssl genpkey -algorithm RSA -out server.key

# Create a server certificate signing request (CSR)
openssl req -new -key server.key -out server.csr -subj "/CN=caddy.cyfamod.com"

# Sign the server CSR with your CA
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 365

# Create a private key for the client
openssl genpkey -algorithm RSA -out client.key

# Create a client CSR
openssl req -new -key client.key -out client.csr -subj "/CN=Client"

# Sign the client CSR with your CA
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 365






# add this to your Caddyfile
# In your Caddyfile, the paths you’ve specified for the CA certificate and server certificates need to be relative to the container's filesystem, not the host machine's filesystem.

caddy.cyfamod.com {
    # Use your own server certificate and key
    tls /etc/caddy/server.crt /etc/caddy/server.key {
        ca /etc/caddy/ca.crt                          # Path to your CA certificate for client verification
        client_auth {
            mode require_and_verify_client_cert       # Require client certificates
            ca /etc/caddy/ca.crt                      # Path to your CA certificate for client verification
        }
    }

    reverse_proxy traefik:8001 {                          # Forward requests to Traefik
        # Optional: Add health checks, load balancing, etc.
    }
}







# this worked


caddy.cyfamod.com {
    tls {
        ca /etc/caddy/ca.crt                          # Path to your CA certificate for client verification
        client_auth {
            mode require                                # Require client certificates (but won't verify)
        }
    }

    reverse_proxy traefik:8001 {                          # Forward requests to Traefik
        # Optional: Add health checks, load balancing, etc.
    }
}
