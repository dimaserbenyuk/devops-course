#!/bin/bash

openssl rand -base64 756 > ${PWD}/rs_keyfile
chmod 400 ${PWD}/rs_keyfile

docker-compose up -d

sleep 5

docker exec mongo1 /scripts/rs-init.sh
