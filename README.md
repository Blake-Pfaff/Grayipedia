# First Run
docker-compose build
docker-compose run --rm api rails db:create
docker-compose run --rm api rails db:migrate
docker-compose run --rm api rails db:seed
docker-compose up

# If you have already run the app
docker-compose up
