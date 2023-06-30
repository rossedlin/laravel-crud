
# Laravel CRUD

cd ~/Projects/laravel-crud-scratch

docker compose down
docker container prune -f
docker volume rm laravel-crud-scratch_database

cd ~/Projects
rm -Rf ~/Projects/laravel-crud-scratch

## Install

composer create-project laravel/laravel laravel-crud-scratch
cd ~/Projects/laravel-crud-scratch

## Git (pre)

git init
git add .
git commit -m "Init"

## Docker (Setup)

curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/docker-compose.yml -o docker-compose.yml
curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/up.sh -o up.sh
curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/down.sh -o down.sh
curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/bash.sh -o bash.sh

chmod +x *.sh

## Artisan

docker compose run --rm web bash -c "php artisan make:model File"

# NPM (pre)

docker compose run --rm web bash -c "npm install bootstrap vue@next vue-loader@next @vitejs/plugin-vue"

## GitHub Overrides

curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/vite.config.js -o ./vite.config.js
curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/routes/web.php -o ./routes/web.php
curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/app/Http/Controllers/AppController.php -o ./app/Http/Controllers/AppController.php
curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/database/migrations/2023_06_19_154135_create_files_table.php -o ./database/migrations/2023_06_19_154135_create_files_table.php
curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/resources/js/app.js -o ./resources/js/app.js
curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/resources/js/App.vue -o ./resources/js/App.vue
curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/resources/views/app.blade.php -o ./resources/views/app.blade.php

## Env

curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/.env.example -o ./.env.example
docker compose run --rm web bash -c "rm .env; cp .env.example .env; php artisan key:generate"

# NPM (post)

docker compose run --rm web bash -c "npm run build"

## Git (post)

git add .

## Docker (Run)

docker compose up -d

sleep 15;

docker exec -it laravel-crud-web bash -c "php artisan migrate:fresh"
