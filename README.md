# SSL-CA
This will server as a portable certificate authority for https clients and servers. **DO NOT USE THESE IN PRODUCTION CODE**

## OpenSSL Commands
- **ecparam**: manipulate or generate EC parameter files.
    - -name prime256v1 is considered a strong EC curve
- **genrsa**: generates an RSA private key.
- **req**: primarily creates and processes certificate requests.
- **x509**: display certificate information, convert certificates to various forms, sign certificate requests like a "mini CA" or edit certificate trust settings.

## Private CA
- Generates and issues certificates
- [Learn More](https://en.wikipedia.org/wiki/Certificate_authority)

### subject
- *Country*: /C=(2 letter code)
- *State or Province*: /ST=(full name or abrv)
- *Locality*: /L=(eg, city)
- *Organization*: /O=(eg, company)
- *Organizational Unit*: /OU=(eg, section)
- *Common Name*: /OU=(eg, server FQDN or YOUR name)

## Server
- It is very important that you provide the hostname or IP address value of your server node with Common Name or else the server client TCP handshake will fail if the hostname does not matches the CN of the server certificate. 
- [Great Tutorial](https://www.golinuxcloud.com/openssl-create-client-server-certificate/)
Generate a server key pair:

## Client
- basically the same as the Server except the only subject filled in is a common name which is generated based of its number.

## Script
To expidite the CA, Server, adn client generation run the bash script to generate the specified number of client certs:

```shell
chmod u+x cert_gen.sh
./cert_gen.sh 10
```