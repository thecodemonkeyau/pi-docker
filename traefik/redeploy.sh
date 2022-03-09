#!/bin/bash

docker stack rm $1
sleep 5
docker stack deploy -c docker-compose.yml $1
docker service logs -f ${1}_traefik

