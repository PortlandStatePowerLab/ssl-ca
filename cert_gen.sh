#!/bin/bash
rm -r certs/*

# Generate the Self-Signed CA
openssl req -newkey rsa:2048 -nodes -keyform PEM -keyout certs/ca.key -x509 -days 3650 -outform PEM -out certs/ca.crt \
    -subj "/C=US/ST=OR/L=Portland/O=Portland State University/OU=Private CA/CN=localhost"

# Generate Server Cert
openssl genrsa -out certs/server.key 2048
openssl req -new -key certs/server.key -out certs/server.req \
    -subj "/C=US/ST=OR/L=Portland/O=Portland State University/OU=Power Lab Department/CN=localhost"
openssl x509 -req -in certs/server.req -CA certs/ca.crt -CAkey certs/ca.key -set_serial 0x123456789 -extensions server -days 3650 -outform PEM -out certs/server.crt

ctr=1
while [ $ctr -le $1 ]
do
openssl genrsa -out certs/client$ctr.key 2048
openssl req -new -key certs/client$ctr.key -out certs/client$ctr.req \
-subj "/C=US/ST=OR/L=Portland/O=Portland State University/OU=Power Lab Department/CN=localhost"
openssl x509 -req -in certs/client$ctr.req -CA certs/ca.crt -CAkey certs/ca.key -set_serial 0x$ctr -days 3650 -outform PEM -out certs/client$ctr.crt
((ctr++))
done
echo All done