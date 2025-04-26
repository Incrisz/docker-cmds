# Generating the CA certificate:

openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -key ca.key -sha256 -days 365 -out ca.crt -subj "/CN=myca"


# Generating the server certificate (for Traefik):
openssl genrsa -out server.key 4096
openssl req -new -key server.key -out server.csr -subj "/CN=yourdomain.com"
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 365 -sha256

# Generating the client certificate:
openssl genrsa -out client.key 4096
openssl req -new -key client.key -out client.csr -subj "/CN=myclient"
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 365 -sha256




