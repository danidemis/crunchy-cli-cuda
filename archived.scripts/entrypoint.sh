#!/bin/sh

if [ -z "$OPENVPN_USER" ]
then
      echo "Variabile vuota. Uscita."
      exit 1
else
      echo "$OPENVPN_USER"  | sudo tee /etc/openvpn/credentials
fi

if [ -z "$OPENVPN_PASSWORD" ]
then
      echo "Variabile vuota. Uscita."
      exit 1
else
      echo "$OPENVPN_PASSWORD"  | sudo tee -a /etc/openvpn/credentials
fi

sudo cp /config/*.ovpn /etc/openvpn/ovpn.conf

sudo openvpn --config client.ovpn --auth-user-pass /etc/openpvn/credentials > /config/openpvn.log

sleep 10

sudo crunchy-cli "$@"