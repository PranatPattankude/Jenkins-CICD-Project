# Jenkins CI/CD Project

This project sets up a complete CI/CD pipeline using Jenkins with a master-worker setup. It builds and deploys a Dockerized application using Docker Compose, pushing the image to Docker Hub. The pipeline is automated using Git hooks.

## Project Features

- **Jenkins Master-Worker Setup**: Distributed build execution using Jenkins agents.
- **Jenkins Shared Library**: Reusable pipeline functions from [jenkins-shared-lib](https://github.com/PranatPattankude/jenkins-shared-lib.git).
- **Docker Build and Deployment**: Containerized application using Docker and Docker Compose.
- **Docker Hub Integration**: Pushes built Docker images to Docker Hub.
- **Git Hooks for Automation**: Automates pipeline execution upon repository changes.

## Prerequisites

- **Jenkins**: Installed and configured with a master and worker nodes.
- **Docker & Docker Compose**: Installed on Jenkins worker nodes.
- **Git**: Installed and configured for Git hooks.
- **Docker Hub Account**: For storing and retrieving images.
- **Jenkins Credentials**: Configured for Git and Docker Hub authentication.

## Jenkins Configuration

### 1. Shared Library Setup

- Navigate to `Manage Jenkins` > `Configure System` > `Global Pipeline Libraries`.
- Add a new library:
  - **Name**: `jenkins-shared-lib`
  - **Default Version**: `main`
  - **Retrieval Method**: Modern SCM
  - **Source Code Management**: Git
  - **Repository URL**: `https://github.com/PranatPattankude/jenkins-shared-lib.git`
  - **Credentials**: Select the appropriate stored credentials.

### 2. Credentials Setup

- Navigate to `Manage Jenkins` > `Manage Credentials`.
- Add credentials for:
  - Git authentication (if required).
  - Docker Hub login (username/password or token).

## CI/CD Pipeline Overview

The `Jenkinsfile` defines the following pipeline stages:

1. **Checkout**: Clones the latest code from the repository.
2. **Build Docker Image**: Builds a Docker image for the application.
3. **Push to Docker Hub**: Tags and pushes the image to Docker Hub.
4. **Deploy using Docker Compose**: Pulls the latest image and deploys the application using Docker Compose.
5. **Automate with Git Hooks**: Triggers the pipeline on repository updates.

## Usage

### 1. Clone the Repository

```bash
   git clone https://github.com/PranatPattankude/Jenkins-CICD-Project.git
   cd Jenkins-CICD-Project
