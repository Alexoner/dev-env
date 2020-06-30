#!/bin/bash

# Generate the CA Key and Certificate of which format is PEM
# uncomment to regenerate from scratch!
# openssl req -x509 -sha256 -newkey rsa:4096 -keyout ca.key -out ca.crt -days 356 -nodes -subj '/CN=Cert Authority 0'
# read decrypted certificate information
openssl x509 -text -noout -in ca.crt |head -n 15

# Generate the Server Key, and Certificate and Sign with the CA Certificate
openssl req -new -newkey rsa:4096 -keyout server.key -out server.csr -nodes -subj '/CN=myserver.com'
openssl x509 -req -sha256 -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt

# (optional) key material can be combined into a single PFX file.
# openssl pkcs12 -export -out client.pfx -inkey client.key -in client.crt --certfile ca.crt
# read pfx file with openssl
# openssl pkcs12 -info -in client.pfx |openssl x509 -noout -text

# Generate the Client Key, and Certificate and Sign with the CA Certificate
openssl req -new -newkey rsa:4096 -keyout client.key -out client.csr -nodes -subj '/CN=myclient'
openssl x509 -req -sha256 -days 365 -in client.csr -CA ca.crt -CAkey ca.key -set_serial 02 -out client.crt

# combine multiple certificates into one
# cat cert1.pem cert2.pem > bundle.pem

# configure server to enable client authentication
echo "enable ssl client certificate authentication, and reload nginx"
cat <<EOF
	ssl_verify_client on;
	ssl_verify_depth 2;
	ssl_client_certificate ca.crt;
EOF

# access server configured with client authentication
# curl -k -i https://localhost:44224 --cert client.crt --key client.key
