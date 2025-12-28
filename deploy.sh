#!/bin/bash

echo "Deploying application using docker compose..."

docker compose down
docker compose up -d

echo "Application deployed successfully"
