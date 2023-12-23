# arm64v8-unifi-network-server
A docker image running MongoDB 4.4.18 + OpenJDK 17 + Unifi Network Server compatible with ARM64v8 devices such as the Raspberry Pi 4

Install docker + docker compose

git clone this repo

sudo docker-compose up -d

If you have a firewall such as UFW make sure you open at a minimum these local ingress ports on your host (the device running the docker container) https://help.ui.com/hc/en-us/articles/218506997-UniFi-Network-Required-Ports-Reference

That's it, access via https://host-ip-address:8443

Built and working on Raspberry Pi 4 with Unifi Network Server 8.0.24-24385-1
