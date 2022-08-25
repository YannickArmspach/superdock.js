#!/bin/bash

unset DOMAIN
DOMAIN="$1"

unset DIR
DIR="$2"

openssl genrsa -des3 -out $DIR/$DOMAIN.key -passout pass:superdock 2048
openssl req -x509 -new -nodes -key $DIR/$DOMAIN.key -passin pass:superdock -sha256 -days 1024 -out $DIR/$DOMAIN.pem -subj "/C=FR/ST=Paris/L=Paris/O=$DOMAIN/OU=$DOMAIN/CN=$DOMAIN"
openssl req -new -sha256 -nodes -out $DIR/cert.csr -newkey rsa:2048 -keyout $DIR/cert.key -config <( printf "[req]\ndefault_bits = 2048\nprompt = no\ndefault_md = sha256\ndistinguished_name = dn\n[dn]\nC=US\nST=RandomState\nL=RandomCity\nO=RandomOrganization\nOU=RandomOrganizationUnit\nemailAddress=hello@$DOMAIN\nCN = $DOMAIN" )
openssl x509 -req -in $DIR/cert.csr -CA $DIR/$DOMAIN.pem -CAkey $DIR/$DOMAIN.key -CAcreateserial -out $DIR/cert.crt -days 365 -sha256 -passin pass:superdock -extfile <( printf "authorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = $DOMAIN" )
openssl x509 -req -in $DIR/cert.csr -CA $DIR/$DOMAIN.pem -CAkey $DIR/$DOMAIN.key -CAcreateserial -out $DIR/cert.en.crt -days 365 -sha256 -passin pass:superdock -extfile <( printf "authorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = en.$DOMAIN" )
