# File to PDF Converter

This project is a web application that allows users to upload documents and convert them to PDF format using LibreOffice. The application is built with Flask and Docker, and it can be deployed using Kubernetes.

## Features

- Upload documents and convert them to PDF
- Supports multiple document formats
- Dockerized for easy deployment
- Kubernetes deployment configuration

## Prerequisites

- Docker
- Docker Compose (optional)
- Kubernetes (Minikube or any other Kubernetes cluster)

## Getting Started

### Running Locally

1. Clone the repository:

    ```sh
    git clone https://github.com/jigmetdadul/DocToPdfConverter.git
    cd DocToPdfConverter
    ```

2. Create a virtual environment and install dependencies:

    ```sh
    python3 -m venv myenv
    source myenv/bin/activate
    pip install -r requirements.txt
    ```

3. Run the Flask application:

    ```sh
    python app.py
    ```

4. Open your browser and navigate to `http://localhost:5001`.

### Running with Docker

1. Build the Docker image:

    ```sh
    docker build -t jigmetsd/doc-to-pdf-converter:latest .
    ```

2. Run the Docker container:

    ```sh
    docker run -d -p 5001:5001 jigmetsd/doc-to-pdf-converter:latest
    ```

3. Open your browser and navigate to `http://localhost:5001`.

### Running with Docker Compose

1. Create a `docker-compose.yml` file:

    ```yaml
    version: '3'
    services:
      app:
        image: jigmetsd/doc-to-pdf-converter:latest
        ports:
          - "5001:5001"
    ```

2. Run Docker Compose:

    ```sh
    docker-compose up -d
    ```

3. Open your browser and navigate to `http://localhost:5001`.

### Deploying to Kubernetes

1. Apply the deployment and service configuration:

    ```sh
    kubectl apply -f deployment.yml
    kubectl apply -f service.yml
    ```

2. Check the status of the deployment:

    ```sh
    kubectl get deployments
    kubectl get services
    ```

3. Access the application using the external IP provided by the LoadBalancer service.

## Project Structure

- `app.py`: Main Flask application
- `templates/`: HTML templates
- `uploads/`: Directory for uploaded files
- `converted/`: Directory for converted PDF files
- `Dockerfile`: Docker image configuration
- `requirements.txt`: Python dependencies
- `deployment.yml`: Kubernetes deployment configuration
- `service.yml`: Kubernetes service configuration
- `run_docker_container.sh`: Script to run the Docker container
- `.github/workflows/docker-image.yml`: GitHub Actions workflow for building and pushing Docker images
