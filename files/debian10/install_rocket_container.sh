#!/bin/bash

cd ~
mkdir rocket.chat && cd rocket.chat

cp /opt/debian10/docker-compose-rocket.yml ./docker-compose.yml

docker-compose up -d mongo

sleep 3

docker ps

sleep 3

docker-compose up -d mongo-init-replica

sleep 3

docker-compose up -d rocketchat

docker ps
