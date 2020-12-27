# Docker Compose For Mongodb Setup On Local Environment With Custom User

## Please follow the steps  to create mongodb server first time.
- Clone the repository
- Rename .env-example to .env
  - mv .env-example .env
- Configure the .env environment variables
- docker-compose up -d
- ./script/docker-entrypoint.sh
- ./script/login-mongodb.sh
