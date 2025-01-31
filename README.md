# Jenkins CI/CD Project

This project demonstrates a CI/CD pipeline using Jenkins with a master-worker setup and a shared library. The shared library is hosted at [jenkins-shared-lib](https://github.com/PranatPattankude/jenkins-shared-lib.git).

## Project Structure

- **Jenkinsfile**: Defines the pipeline stages and integrates the shared library.
- **src/**: Contains the source code of the application.
- **tests/**: Includes test cases for the application.

## Prerequisites

- **Jenkins**: Ensure Jenkins is installed and configured with master and worker nodes.
- **Git**: Installed and configured on both Jenkins master and worker nodes.
- **Credentials**: Set up in Jenkins for accessing the shared library and any other necessary repositories.

## Jenkins Configuration

1. **Shared Library Setup**:
   - Navigate to `Manage Jenkins` > `Configure System` > `Global Pipeline Libraries`.
   - Add a new library with the following details:
     - **Name**: `jenkins-shared-lib`
     - **Default Version**: Specify the branch or tag to use, e.g., `main`.
     - **Retrieval Method**: Modern SCM
     - **Source Code Management**: Git
     - **Project Repository**: `https://github.com/PranatPattankude/jenkins-shared-lib.git`
     - **Credentials**: Select the appropriate credentials if required.

2. **Credentials Setup**:
   - Navigate to `Manage Jenkins` > `Manage Credentials`.
   - Add credentials for accessing the shared library and any other external systems.

## Pipeline Overview

The Jenkins pipeline (`Jenkinsfile`) includes the following stages:

1. **Checkout**: Retrieves the latest code from the repository.
2. **Build**: Compiles the application.
3. **Test**: Executes unit and integration tests.
4. **Deploy**: Deploys the application to the target environment.

The pipeline utilizes the shared library for common functions and steps, promoting reusability and maintainability.

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/PranatPattankude/Jenkins-CICD-Project.git
   cd Jenkins-CICD-Project
