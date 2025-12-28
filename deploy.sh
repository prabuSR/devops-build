#!/bin/bash
set -e

if [ "$BRANCH_NAME" = "dev" ]; then
  export IMAGE_NAME=prabusr/dev:latest
  export HOST_PORT=8081
elif [ "$BRANCH_NAME" = "main" ]; then
  export IMAGE_NAME=prabusr/prod:latest
  export HOST_PORT=80
else
  echo "Unknown branch: $BRANCH_NAME"
  exit 1
fi

echo "Deploying image: $IMAGE_NAME on port $HOST_PORT"

docker compose down
docker compose pull
docker compose up -d

echo "Deployment successful"

