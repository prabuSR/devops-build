#!/bin/bash

echo "Building Docker image..."

IMAGE_NAME=devops-static:v1

docker build -t $IMAGE_NAME .

echo "Docker image built successfully: $IMAGE_NAME"
