
docker compose down
docker compose up -d

sleep 15;

docker exec -it laravel-crud-web bash -c "php artisan migrate:fresh"
