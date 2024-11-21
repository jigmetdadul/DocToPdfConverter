# Dockerized Python Application with GitHub Actions

This repository contains a Python-based UI web application that converts doc file to pdf file. It is Dockerized and set up with an automated CI/CD pipeline using GitHub Actions. The project includes a sample `Dockerfile` with a multistage build and uses GitHub Actions to build and push Docker images to Docker Hub.

---

## Features

- **Python 3.9 Environment**: Slim-based Python image for smaller Docker images.
- **Multistage Docker Build**: Ensures minimal final image size.
- **Automated CI/CD**: GitHub Actions pipeline for building and pushing Docker images.
- **LibreOffice Integration**: Includes LibreOffice installation for advanced processing tasks.
- **Customizable Build**: Supports unique tagging of Docker images for version control.

---

## Prerequisites

To run or modify this project, you need the following installed:

- [Docker](https://www.docker.com/get-started) (latest version)
- [Git](https://git-scm.com/)
- A [Docker Hub](https://hub.docker.com/) account
- (Optional) A GitHub account for CI/CD setup

---

## Setup Instructions

### **1. Clone the Repository**
```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
