#!/bin/bash
set -e

if [ "$BRANCH_NAME" = "dev" ]; then
  IMAGE_NAME=prabusr/dev:latest
elif [ "$BRANCH_NAME" = "main" ]; then
  IMAGE_NAME=prabusr/prod:latest
else
  echo "Unknown branch: $BRANCH_NAME"
  exit 1
fi

echo "Building image: $IMAGE_NAME"

docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME

echo "Image pushed successfully"

