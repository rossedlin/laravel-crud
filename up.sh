
docker compose down
docker compose up -d

sleep 10;

docker exec -it laravel-crud-web bash -c "php artisan migrate:fresh"

npm run build
