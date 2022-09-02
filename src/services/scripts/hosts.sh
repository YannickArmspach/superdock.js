#!/bin/bash

unset DOMAIN_1
DOMAIN_1="$1"

unset DOMAIN_2
DOMAIN_2="$2"

unset DOMAIN_3
DOMAIN_3="$3"

unset DOMAIN_4
DOMAIN_4="$4"

unset DOMAIN_5
DOMAIN_5="$5"


if [ $DOMAIN_1 ]; then
  if ! grep -q "0.0.0.0 $DOMAIN_1 #superdock" /etc/hosts; then
    echo "Adding $DOMAIN_1 to hosts ..."
    sudo -S sh -c -e "echo '0.0.0.0 $DOMAIN_1 #superdock' >> /etc/hosts"
  fi
fi

if [ $DOMAIN_2 ]; then
  if ! grep -q "0.0.0.0 $DOMAIN_2 #superdock" /etc/hosts; then
    echo "Adding $DOMAIN_2 to hosts ..."
    sudo -S sh -c -e "echo '0.0.0.0 $DOMAIN_2 #superdock' >> /etc/hosts"
  fi
fi

if [ $DOMAIN_3 ]; then
  if ! grep -q "0.0.0.0 $DOMAIN_3 #superdock" /etc/hosts; then
    echo "Adding $DOMAIN_3 to hosts ..."
    sudo -S sh -c -e "echo '0.0.0.0 $DOMAIN_3 #superdock' >> /etc/hosts"
  fi
fi

if [ $DOMAIN_4 ]; then
  if ! grep -q "0.0.0.0 $DOMAIN_4 #superdock" /etc/hosts; then
    echo "Adding $DOMAIN_4 to hosts ..."
    sudo -S sh -c -e "echo '0.0.0.0 $DOMAIN_4 #superdock' >> /etc/hosts"
  fi
fi

if [ $DOMAIN_5 ]; then
  if ! grep -q "0.0.0.0 $DOMAIN_5 #superdock" /etc/hosts; then
    echo "Adding $DOMAIN_5 to hosts ..."
    sudo -S sh -c -e "echo '0.0.0.0 $DOMAIN_5 #superdock' >> /etc/hosts"
  fi
fi


if ! grep -q "0.0.0.0 adminer.superdock.dev #superdock" /etc/hosts; then
  echo "Adding adminer.superdock.dev to hosts ..."
  sudo -S sh -c -e "echo '0.0.0.0 adminer.superdock.dev #superdock' >> /etc/hosts"
fi

if ! grep -q "0.0.0.0 mailhog.superdock.dev #superdock" /etc/hosts; then
  echo "Adding mailhog.superdock.dev to hosts ..."
  sudo -S sh -c -e "echo '0.0.0.0 mailhog.superdock.dev #superdock' >> /etc/hosts"
fi

if ! grep -q "0.0.0.0 rediscommander.superdock.dev #superdock" /etc/hosts; then
  echo "Adding rediscommander.superdock.dev to hosts ..."
  sudo -S sh -c -e "echo '0.0.0.0 rediscommander.superdock.dev #superdock' >> /etc/hosts"
fi