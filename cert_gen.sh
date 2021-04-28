#!/bin/bash
# Generate the Self-Signed CA
openssl ecparam -name prime256v1 -genkey -noout -out certs/ca.key
openssl req -new -x509 -sha256 -days 3650 -out certs/ca.crt -key certs/ca.key -subj "/C=US/ST=OR/L=Portland/O=Portland State University/OU=Private CA/CN=localhost"

# Generate Server Cert
openssl genrsa -out certs/server.key 2048
openssl req -new -sha256 -key certs/server.key -out certs/server.req -subj "/C=US/ST=OR/L=Portland/O=Portland State University/OU=Power Lab Department/CN=localhost"
openssl x509 -req -in certs/server.req -CA certs/ca.crt -CAkey certs/ca.key -sha256 -days 3650 -outform PEM -out certs/server.crt 

ctr=1
while [ $ctr -le $1 ]
do
openssl genrsa -out certs/client$ctr.key 2048
openssl req -new -sha256 -key certs/client$ctr.key -out certs/client$ctr.req -subj "/CN=DCM $ctr"
openssl x509 -req -in certs/client$ctr.req -CA certs/ca.crt -CAkey certs/ca.key -sha256 -days 3650 -outform PEM -out certs/client$ctr.crt
((ctr++))
done
echo All done