#!/bin/bash

unset DIR
DIR="$1"

#TOOLS_CERT
unset DIR_TOOLS
DIR_TOOLS=$(dirname "$(dirname "$0")")/certificates

unset DOMAIN_1
DOMAIN_1="$2"

unset DOMAIN_2
DOMAIN_2="$3"

unset DOMAIN_3
DOMAIN_3="$4"

unset DOMAIN_4
DOMAIN_4="$5"

unset DOMAIN_5
DOMAIN_5="$6"


#DOMAIN_1
if [ $DOMAIN_1 ] && [ ! -f $DIR/$DOMAIN_1/$DOMAIN_1.pem ]; then
  rm -rf $DIR/$DOMAIN_1
  mkdir $DIR/$DOMAIN_1
  openssl genrsa -des3 -out $DIR/$DOMAIN_1/$DOMAIN_1.key -passout pass:superdock 2048
  openssl req -x509 -new -nodes -key $DIR/$DOMAIN_1/$DOMAIN_1.key -passin pass:superdock -sha256 -days 1024 -out $DIR/$DOMAIN_1/$DOMAIN_1.pem -subj "/C=FR/ST=Paris/L=Paris/O=$DOMAIN_1/OU=$DOMAIN_1/CN=$DOMAIN_1"
  openssl req -new -sha256 -nodes -out $DIR/$DOMAIN_1/cert.csr -newkey rsa:2048 -keyout $DIR/$DOMAIN_1/cert.key -config <( printf "[req]\ndefault_bits = 2048\nprompt = no\ndefault_md = sha256\ndistinguished_name = dn\n[dn]\nC=US\nST=RandomState\nL=RandomCity\nO=RandomOrganization\nOU=RandomOrganizationUnit\nemailAddress=hello@$DOMAIN_1\nCN = $DOMAIN_1" )
  openssl x509 -req -in $DIR/$DOMAIN_1/cert.csr -CA $DIR/$DOMAIN_1/$DOMAIN_1.pem -CAkey $DIR/$DOMAIN_1/$DOMAIN_1.key -CAcreateserial -out $DIR/$DOMAIN_1/cert.crt -days 365 -sha256 -passin pass:superdock -extfile <( printf "authorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = $DOMAIN_1" )
fi
if [ $DOMAIN_1 ] && [ -f $DIR/$DOMAIN_1/$DOMAIN_1.pem ]; then
  security verify-cert -c $DIR/$DOMAIN_1/$DOMAIN_1.pem > /dev/null 2>&1
  if [ $? != 0 ]; then
    echo "Adding $DOMAIN_1 certificate to trust store ..."
    sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR/$DOMAIN_1/$DOMAIN_1.pem"
  fi
fi


#DOMAIN_2
if [ $DOMAIN_2 ] && [ ! -f $DIR/$DOMAIN_2/$DOMAIN_2.pem ]; then
  rm -rf $DIR/$DOMAIN_2
  mkdir $DIR/$DOMAIN_2
  openssl genrsa -des3 -out $DIR/$DOMAIN_2/$DOMAIN_2.key -passout pass:superdock 2048
  openssl req -x509 -new -nodes -key $DIR/$DOMAIN_2/$DOMAIN_2.key -passin pass:superdock -sha256 -days 1024 -out $DIR/$DOMAIN_2/$DOMAIN_2.pem -subj "/C=FR/ST=Paris/L=Paris/O=$DOMAIN_2/OU=$DOMAIN_2/CN=$DOMAIN_2"
  openssl req -new -sha256 -nodes -out $DIR/$DOMAIN_2/cert.csr -newkey rsa:2048 -keyout $DIR/$DOMAIN_2/cert.key -config <( printf "[req]\ndefault_bits = 2048\nprompt = no\ndefault_md = sha256\ndistinguished_name = dn\n[dn]\nC=US\nST=RandomState\nL=RandomCity\nO=RandomOrganization\nOU=RandomOrganizationUnit\nemailAddress=hello@$DOMAIN_2\nCN = $DOMAIN_2" )
  openssl x509 -req -in $DIR/$DOMAIN_2/cert.csr -CA $DIR/$DOMAIN_2/$DOMAIN_2.pem -CAkey $DIR/$DOMAIN_2/$DOMAIN_2.key -CAcreateserial -out $DIR/$DOMAIN_2/cert.crt -days 365 -sha256 -passin pass:superdock -extfile <( printf "authorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = $DOMAIN_2" )
  sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR/$DOMAIN_2/$DOMAIN_2.pem"
fi
if [ $DOMAIN_2 ] && [ -f $DIR/$DOMAIN_2/$DOMAIN_2.pem ]; then
  security verify-cert -c $DIR/$DOMAIN_2/$DOMAIN_2.pem > /dev/null 2>&1
  if [ $? != 0 ]; then
    echo "Adding $DOMAIN_2 certificate to trust store ..."
    sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR/$DOMAIN_2/$DOMAIN_2.pem"
  fi
fi


#DOMAIN_3
if [ $DOMAIN_3 ] && [ ! -f $DIR/$DOMAIN_3/$DOMAIN_3.pem ]; then
  rm -rf $DIR/$DOMAIN_3
  mkdir $DIR/$DOMAIN_3
  openssl genrsa -des3 -out $DIR/$DOMAIN_3/$DOMAIN_3.key -passout pass:superdock 2048
  openssl req -x509 -new -nodes -key $DIR/$DOMAIN_3/$DOMAIN_3.key -passin pass:superdock -sha256 -days 1024 -out $DIR/$DOMAIN_3/$DOMAIN_3.pem -subj "/C=FR/ST=Paris/L=Paris/O=$DOMAIN_3/OU=$DOMAIN_3/CN=$DOMAIN_3"
  openssl req -new -sha256 -nodes -out $DIR/$DOMAIN_3/cert.csr -newkey rsa:2048 -keyout $DIR/$DOMAIN_3/cert.key -config <( printf "[req]\ndefault_bits = 2048\nprompt = no\ndefault_md = sha256\ndistinguished_name = dn\n[dn]\nC=US\nST=RandomState\nL=RandomCity\nO=RandomOrganization\nOU=RandomOrganizationUnit\nemailAddress=hello@$DOMAIN_3\nCN = $DOMAIN_3" )
  openssl x509 -req -in $DIR/$DOMAIN_3/cert.csr -CA $DIR/$DOMAIN_3/$DOMAIN_3.pem -CAkey $DIR/$DOMAIN_3/$DOMAIN_3.key -CAcreateserial -out $DIR/$DOMAIN_3/cert.crt -days 365 -sha256 -passin pass:superdock -extfile <( printf "authorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = $DOMAIN_3" )
  sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR/$DOMAIN_3/$DOMAIN_3.pem"
fi
if [ $DOMAIN_3 ] && [ -f $DIR/$DOMAIN_3/$DOMAIN_3.pem ]; then
  security verify-cert -c $DIR/$DOMAIN_3/$DOMAIN_3.pem > /dev/null 2>&1
  if [ $? != 0 ]; then
    echo "Adding $DOMAIN_3 certificate to trust store ..."
    sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR/$DOMAIN_3/$DOMAIN_3.pem"
  fi
fi


#DOMAIN_4
if [ $DOMAIN_4 ] && [ ! -f $DIR/$DOMAIN_4/$DOMAIN_4.pem ]; then
  rm -rf $DIR/$DOMAIN_4
  mkdir $DIR/$DOMAIN_4
  openssl genrsa -des3 -out $DIR/$DOMAIN_4/$DOMAIN_4.key -passout pass:superdock 2048
  openssl req -x509 -new -nodes -key $DIR/$DOMAIN_4/$DOMAIN_4.key -passin pass:superdock -sha256 -days 1024 -out $DIR/$DOMAIN_4/$DOMAIN_4.pem -subj "/C=FR/ST=Paris/L=Paris/O=$DOMAIN_4/OU=$DOMAIN_4/CN=$DOMAIN_4"
  openssl req -new -sha256 -nodes -out $DIR/$DOMAIN_4/cert.csr -newkey rsa:2048 -keyout $DIR/$DOMAIN_4/cert.key -config <( printf "[req]\ndefault_bits = 2048\nprompt = no\ndefault_md = sha256\ndistinguished_name = dn\n[dn]\nC=US\nST=RandomState\nL=RandomCity\nO=RandomOrganization\nOU=RandomOrganizationUnit\nemailAddress=hello@$DOMAIN_4\nCN = $DOMAIN_4" )
  openssl x509 -req -in $DIR/$DOMAIN_4/cert.csr -CA $DIR/$DOMAIN_4/$DOMAIN_4.pem -CAkey $DIR/$DOMAIN_4/$DOMAIN_4.key -CAcreateserial -out $DIR/$DOMAIN_4/cert.crt -days 365 -sha256 -passin pass:superdock -extfile <( printf "authorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = $DOMAIN_4" )
  sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR/$DOMAIN_4/$DOMAIN_4.pem"
fi
if [ $DOMAIN_4 ] && [ -f $DIR/$DOMAIN_4/$DOMAIN_4.pem ]; then
  security verify-cert -c $DIR/$DOMAIN_4/$DOMAIN_4.pem > /dev/null 2>&1
  if [ $? != 0 ]; then
    echo "Adding $DOMAIN_4 certificate to trust store ..."
    sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR/$DOMAIN_4/$DOMAIN_4.pem"
  fi
fi


#DOMAIN_5
if [ $DOMAIN_5 ] && [ ! -f $DIR/$DOMAIN_5/$DOMAIN_5.pem ]; then
  rm -rf $DIR/$DOMAIN_5
  mkdir $DIR/$DOMAIN_5
  openssl genrsa -des3 -out $DIR/$DOMAIN_5/$DOMAIN_5.key -passout pass:superdock 2048
  openssl req -x509 -new -nodes -key $DIR/$DOMAIN_5/$DOMAIN_5.key -passin pass:superdock -sha256 -days 1024 -out $DIR/$DOMAIN_5/$DOMAIN_5.pem -subj "/C=FR/ST=Paris/L=Paris/O=$DOMAIN_5/OU=$DOMAIN_5/CN=$DOMAIN_5"
  openssl req -new -sha256 -nodes -out $DIR/$DOMAIN_5/cert.csr -newkey rsa:2048 -keyout $DIR/$DOMAIN_5/cert.key -config <( printf "[req]\ndefault_bits = 2048\nprompt = no\ndefault_md = sha256\ndistinguished_name = dn\n[dn]\nC=US\nST=RandomState\nL=RandomCity\nO=RandomOrganization\nOU=RandomOrganizationUnit\nemailAddress=hello@$DOMAIN_5\nCN = $DOMAIN_5" )
  openssl x509 -req -in $DIR/$DOMAIN_5/cert.csr -CA $DIR/$DOMAIN_5/$DOMAIN_5.pem -CAkey $DIR/$DOMAIN_5/$DOMAIN_5.key -CAcreateserial -out $DIR/$DOMAIN_5/cert.crt -days 365 -sha256 -passin pass:superdock -extfile <( printf "authorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = $DOMAIN_5" )
  sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR/$DOMAIN_5/$DOMAIN_5.pem"
fi
if [ $DOMAIN_5 ] && [ -f $DIR/$DOMAIN_5/$DOMAIN_5.pem ]; then
  security verify-cert -c $DIR/$DOMAIN_5/$DOMAIN_5.pem > /dev/null 2>&1
  if [ $? != 0 ]; then
    echo "Adding $DOMAIN_5 certificate to trust store ..."
    sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR/$DOMAIN_5/$DOMAIN_5.pem"
  fi
fi


#adminer.superdock.dev
if [ ! -f $DIR_TOOLS/adminer.superdock.dev/adminer.superdock.dev.pem ]; then
  mkdir $DIR_TOOLS/adminer.superdock.dev
  openssl genrsa -des3 -out $DIR_TOOLS/adminer.superdock.dev/adminer.superdock.dev.key -passout pass:superdock 2048
  openssl req -x509 -new -nodes -key $DIR_TOOLS/adminer.superdock.dev/adminer.superdock.dev.key -passin pass:superdock -sha256 -days 1024 -out $DIR_TOOLS/adminer.superdock.dev/adminer.superdock.dev.pem -subj "/C=FR/ST=Paris/L=Paris/O=adminer.superdock.dev/OU=adminer.superdock.dev/CN=adminer.superdock.dev"
  openssl req -new -sha256 -nodes -out $DIR_TOOLS/adminer.superdock.dev/cert.csr -newkey rsa:2048 -keyout $DIR_TOOLS/adminer.superdock.dev/cert.key -config <( printf "[req]\ndefault_bits = 2048\nprompt = no\ndefault_md = sha256\ndistinguished_name = dn\n[dn]\nC=US\nST=RandomState\nL=RandomCity\nO=RandomOrganization\nOU=RandomOrganizationUnit\nemailAddress=hello@adminer.superdock.dev\nCN = adminer.superdock.dev" )
  openssl x509 -req -in $DIR_TOOLS/adminer.superdock.dev/cert.csr -CA $DIR_TOOLS/adminer.superdock.dev/adminer.superdock.dev.pem -CAkey $DIR_TOOLS/adminer.superdock.dev/adminer.superdock.dev.key -CAcreateserial -out $DIR_TOOLS/adminer.superdock.dev/cert.crt -days 365 -sha256 -passin pass:superdock -extfile <( printf "authorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = adminer.superdock.dev" )
fi
security verify-cert -c $DIR_TOOLS/adminer.superdock.dev/adminer.superdock.dev.pem > /dev/null 2>&1
if [ $? != 0 ]; then
    echo "Adding adminer.superdock.dev certificate to trust store ..."
    sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR_TOOLS/adminer.superdock.dev/adminer.superdock.dev.pem"
fi

#mailhog.superdock.dev
security verify-cert -c $DIR_TOOLS/mailhog.superdock.dev/mailhog.superdock.dev.pem > /dev/null 2>&1
if [ $? != 0 ]; then
    echo "Adding mailhog.superdock.dev certificate to trust store ..."
    sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR_TOOLS/mailhog.superdock.dev/mailhog.superdock.dev.pem"
fi

#rediscommander.superdock.dev
security verify-cert -c $DIR_TOOLS/rediscommander.superdock.dev/rediscommander.superdock.dev.pem > /dev/null 2>&1
if [ $? != 0 ]; then
    echo "Adding rediscommander.superdock.dev certificate to trust store ..."
    sudo -S sh -c -e "security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $DIR_TOOLS/rediscommander.superdock.dev/rediscommander.superdock.dev.pem"
fi