#!/bin/sh


echo "$OPENVPN_USER" | sudo tee /etc/openvpn/credentials
echo "$OPENVPN_PASSWORD" | sudo tee -a /etc/openvpn/credentials

cat /etc/openvpn/credentials > /config/credentials
#sudo openvpn --config client.ovpn --auth-user-pass /etc/openpvn/credentials &

