#!/bin/bash
set -e

if [ "$BRANCH_NAME" = "dev" ]; then
  export IMAGE_NAME=<dockerhub-username>/dev:latest
elif [ "$BRANCH_NAME" = "main" ]; then
  export IMAGE_NAME=<dockerhub-username>/prod:latest
else
  echo "Unknown branch: $BRANCH_NAME"
  exit 1
fi

echo "Deploying image: $IMAGE_NAME"

docker compose down
docker compose pull
docker compose up -d

echo "Deployment complete"
