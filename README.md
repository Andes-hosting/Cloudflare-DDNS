# Cloudflare-DDNS
This is a custom Docker image that you can build to deploy a container capable of updating your public IP with one or more domains in Cloudflare. It is particularly useful for home users who cannot afford to have a static public IP address, like myself, and rely on their home's internet, which typically provides a dynamic IP address. Hence, the name "DDNS" stands for Dynamic Domain Name System, as the goal is to have a domain name associated with a dynamic IP.

This container is built with Alpine Linux and is based on the [cloudflare-ddns-updater](https://github.com/K0p1-Git/cloudflare-ddns-updater) GitHub repository.

## Purpose

The primary purpose of this image is to assist you when self-hosting your own server without a static IP from your internet provider. By using this container, you can avoid future problems caused by IP address changes. The container will automatically update your public IP to your free Cloudflare account through the DDNS API.

## How to Use

To get started, clone this repository and use the following command to build the image and run it as a container:
```
docker-compose up -d --build
```
By doing this, the container will be up and running, and your IP will be updated for as many domains as needed.

Enjoy seamless and reliable dynamic DNS updates with Cloudflare-DDNS!
