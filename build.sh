#!/usr/bin/env bash

docker compose run --rm web bash -c "composer install"
docker compose run --rm web bash -c "yarn install"
