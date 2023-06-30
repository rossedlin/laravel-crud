
# Laravel CRUD

cd ~/Projects/laravel-crud-scratch

docker compose down
docker container prune -f
docker volume rm laravel-crud-scratch_sail-mysql

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

curl https://raw.githubusercontent.com/rossedlin/laravel-docker/master/docker-compose.yml -o docker-compose.yml
curl https://raw.githubusercontent.com/rossedlin/laravel-docker/master/up.sh -o up.sh
curl https://raw.githubusercontent.com/rossedlin/laravel-docker/master/down.sh -o down.sh
curl https://raw.githubusercontent.com/rossedlin/laravel-docker/master/bash.sh -o bash.sh

chmod +x *.sh

## Composer

#docker compose run web bash -c "composer require inertiajs/inertia-laravel"
#docker compose run web bash -c "composer require laravel/ui"

# Artisan

#docker compose run web bash -c "php artisan inertia:middleware"
#docker compose run web bash -c "php artisan ui bootstrap"
#docker compose run web bash -c "php artisan ui vue"

# NPM (pre)

#docker compose run web bash -c "npm install"

## GitHub Overrides

#curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/routes/web.php -o ./routes/web.php
#curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/app/Http/Kernel.php -o ./app/Http/Kernel.php
#curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/app/Http/Controllers/FileController.php -o ./app/Http/Controllers/FileController.php

#curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/resources/js/app.js -o ./resources/js/app.js
#curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/resources/views/app.blade.php -o ./resources/views/app.blade.php

#curl https://raw.githubusercontent.com/rossedlin/laravel-crud/master/resources/js/Pages/Welcome.vue --create-dirs -o ./resources/js/Pages/Welcome.vue

# NPM (post)

#docker compose run web bash -c "yarn build"

## Git (post)

git add .

## Docker (Run)

#docker compose up -d
