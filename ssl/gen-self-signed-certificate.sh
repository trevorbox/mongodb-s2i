#!/bin/bash

rm -rf ./out/

mkdir -p out

echo -e "\nCreate root CA key...\n"
openssl genrsa -des3 -out out/rootCA.key 2048

echo -e "\nCreate root SSL certificate...\n"
openssl req -x509 -new -nodes -key out/rootCA.key -sha256 -days 1024 -out out/rootCA.pem

#server.csr.cnf and v3.ext already exist

echo -e "\nCreate server certificate key and csr...\n"
openssl req -new -sha256 -nodes -out out/server.csr -newkey rsa:2048 -keyout out/server.key -config <( cat server.csr.cnf )

echo -e "\nCreate server certificate...\n"
openssl x509 -req -in out/server.csr -CA out/rootCA.pem -CAkey out/rootCA.key -CAcreateserial -out out/server.crt -days 500 -sha256 -extfile v3.ext

echo -e "\nPut them in the right place...\n"
cp out/rootCA.pem ../upload/src/mongodb-ssl/ca.pem
cp out/server.key ../upload/src/mongodb-ssl/mongodb.pem
cat out/server.crt >> ../upload/src/mongodb-ssl/mongodb.pem

echo -e "\nDone!\n"
