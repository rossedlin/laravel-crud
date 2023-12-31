#!/usr/bin/env bash

docker compose down
docker system prune -af

rm -R vendor
rm -R node_modules
rm -R public/build
rm ./storage/logs/*.log
