# Jenkins CI/CD Project

This project sets up a complete CI/CD pipeline using Jenkins with a master-worker setup. It builds and deploys a Dockerized application using Docker Compose, pushing the image to Docker Hub. The pipeline is automated using Git hooks.

## Project Features

- **Terraform for Infrastructure Automation**: Automates provisioning and management of infrastructure resources.
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

- **Clone the code using this command**:
   ```bash
   git clone https://github.com/PranatPattankude/Jenkins-CICD-Project.git
   cd Jenkins-CICD-Project


### Jenkins CI/CD Pipeline with GitHub Webhooks

This repository contains the configuration for a Jenkins pipeline that automates the build, push, and deployment of Docker containers and images using Docker Compose. The pipeline is triggered via GitHub Webhooks, ensuring an automated process every time changes are pushed to the repository.

## Steps for Setup and Configuration

### 1. Configure Git Hooks (for Automation)

#### GitHub Hook Trigger for GITScm Polling in Jenkins

- Open your Jenkins job configuration.
- In the **Source Code Management** section, select **Git**.
- Under **Repository URL**, specify the GitHub repository.
- In **Build Triggers**, check the option for **GitHub hook trigger for GITScm polling**.

#### Configure GitHub Webhooks

- Navigate to your GitHub repository settings.
- Go to **Webhooks** > **Add webhook**.
- Set the **Payload URL** to `http://<JENKINS_URL>/github-webhook/`.
- Select **application/x-www-form-urlencoded** as the **Content type**.
- Choose **Just the push event**.
- Click **Add webhook**.

### 2. Run the Pipeline

- Ensure that Jenkins is configured with the necessary **shared library** and **credentials** for your repository.
- Create a new Jenkins pipeline job and point it to this repository.
- You can trigger the pipeline manually or let it be automatically triggered through the GitHub webhook on each code push.

### 3. Automated Deployment

- The pipeline will automatically:
  - Build the project.
  - Push Docker containers and images.
  - Deploy the containers using **Docker Compose**.
  
No manual deployment is required, as everything is handled by the pipeline.

## Conclusion

This setup allows for seamless automation of building, pushing, and deploying containers, saving time and ensuring consistency across environments.
