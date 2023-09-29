#!/bin/bash

frontend_dir="frontend"

# Check if the node_modules directory exists
if [ ! -d "$frontend_dir/node_modules/" ];
  then
    echo "node_modules directory not found. Running npm install..."
    cd "$frontend_dir" || exit 1
    npm install

    if [ $? -eq 0 ]; then
      echo "npm install completed successfully."
    else
      echo "npm install failed."
      exit 1
    fi

    cd ..
  else
    echo "node_modules already exists, running docker-compose"
fi
docker compose --env-file .env.dev up --build
