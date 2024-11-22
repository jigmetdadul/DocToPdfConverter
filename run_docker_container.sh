#!/bin/bash

# Define the image name and tag
IMAGE_NAME="jigmetsd/doc-to-pdf-converter"
TAG="latest"
PORT=5001

# Function to check if Docker is installed
check_docker() {
  if ! command -v docker &> /dev/null
  then
    echo "Docker is not installed. Please install Docker first."
    exit 1
  fi
}

# Function to pull the Docker image from Docker Hub
pull_image() {
  echo "Pulling the Docker image from Docker Hub..."
  docker pull $IMAGE_NAME:$TAG
}

# Function to run the Docker container
run_container() {
  echo "Running the Docker container on port $PORT..."
  docker run -d -p $PORT:$PORT $IMAGE_NAME:$TAG
  if [ $? -eq 0 ]; then
    echo "Container is running successfully!"
  else
    echo "There was an issue starting the container."
    exit 1
  fi
}

# Function to show the status of running containers
container_status() {
  echo "Checking running containers..."
  docker ps
}

# Function to print instructions for accessing the application
access_instructions() {
  echo ""
  echo "You can now access the application using the following methods:"
  echo "1. Open a browser and navigate to http://localhost:$PORT"
  echo "2. Use cURL to test the connection: curl http://localhost:$PORT"
}

# Main script execution
check_docker
pull_image
run_container
container_status
access_instructions
