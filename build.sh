#!/bin/bash

docker pull alpine:3.4
docker build -t base-alpine:3.4 -f Dockerfile.base .
docker-compose build
docker tag -f authstore_consul kenjones/authstore-consul
docker tag -f authstore_vault kenjones/authstore-vault
