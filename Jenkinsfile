@Library("Shared") _
pipeline {
    agent { label "ram" }

    stages {
        stage('Code') {
            steps {
                script{
                    gitpull("https://github.com/PranatPattankude/HTML-CICD-Project.git", "main")
                }
                
            }
        }
        stage('Build') {
            steps {
                script{
                    build("apache-app", "latest")
                }
            }
        }
        stage('PushToDocker') {
            steps {
                script{
                    dockerpush("apache-app", "latest")
                }
            }
        }
        stage('Deploy') {
            steps {
                deploy()
            }
        }
    }
}
