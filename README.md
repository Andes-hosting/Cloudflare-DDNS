# Cloudflare-DDNS
This is a custom Docker image that you can build to deploy a container capable of updating your public IP with one or more domains in Cloudflare. It is particularly useful for home users who cannot afford to have a static public IP address, like myself, and rely on their home's internet, which typically provides a dynamic IP address. Hence, the name "DDNS" stands for Dynamic Domain Name System, as the goal is to have a domain name associated with a dynamic IP.

This container is built with Alpine Linux and is based on the [cloudflare-ddns-updater](https://github.com/K0p1-Git/cloudflare-ddns-updater) GitHub repository.

## Purpose

The primary purpose of this image is to assist you when self-hosting your own server without a static IP from your internet provider. By using this container, you can avoid future problems caused by IP address changes. The container will automatically update your public IP to your free Cloudflare account through the DDNS API.

## Asumptions

To use this container we assume that you already have a Cloudflare account and you have already bought a custom domain. And your intention is to set up a dynamic IP address to your custom domain using Cloudflare as DNS.

Also, it is important to note that this image is not intended to create new DNS records, only update them, so if you need to add new ones, you must first create them manually and then add them to this container's environment. Otherwise, you will see an error message in the container logs.

## How to use (Build)

To get started, clone this repository and use the following command to build the image and run it as a container:
```shell
docker compose up -d --build
```
By doing this, the container will be up and running, and your IP will be updated for as many domains as needed.

## How to use (Docker Compose)

If you prefer to use a docker compose instead you can use the following docker image in [DockerHub](https://hub.docker.com/r/leadvic/cloudflare_ddns)

Here is an example of a docker-compose.yml you can use to set this container working
```yaml
version: '3.9'

services:
  cloudflare:
    image: leadvic/cloudflare_ddns:latest
    restart: always
    environment:
      REFRESH: 1 #1 (This number is in minutes, where min is 1 and max is 60)
      AUTH_EMAIL: your-email@mail.com #admin@example.com
      AUTH_METHOD: global #token/global
      AUTH_KEY: this_is_a_super_long_token #1234asdf
      TTL: 3600 #3600 (This number is in seconds, where min is 60 and max is 86400)
      PROXY: false #true/false
      ZONE_ID_1: this_is_another_super_long_token #1234asdf
      RECORD_NAME_1: your.custom.domain #example.com
      #ZONE_ID_2: this_is_yet_another_super_long_token #1234asdf
      #RECORD_NAME_2: other.custom.domain #example.com
```

## Environment variables

In most cases you will use all of the environment variables and set them as shown in the example above. The only variables you need to set up no matter what are:
- AUTH_EMAIL
- AUTH_KEY
- ZONE_ID_1
- RECORD_NAME_1

And the rest of the environment variables will be set as default as follows:
- REFRESH: 1
- AUTH_METHOD: global
- TTL: 3600
- PROXY: true

Remember that you can add several custom domains in one machine adding as the following variables:
- ZONE_ID_2
- RECORD_NAME_2
- ZONE_ID_3
- RECORD_NAME_3

This docker image let you add up to 10 different record names. If you need more you'll have to modify the repositry, to do so you can do a fork as modify as you want.

## Thank you

Enjoy seamless and reliable dynamic DNS updates with Cloudflare-DDNS!
