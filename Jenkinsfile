@Library("Shared") _
pipeline {
    agent { label "ram" }
    environment{
        RECIPIENTS = "pranatpattankude143@gmail.com,developer.pspdeveloper@gmail.com"
    }

    stages {
        stage('Code') {
            steps {
                script{
                    gitpull("https://github.com/PranatPattankude/Jenkins-CICD-Project.git", "main")
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
    post {
    success {
        script {
            echo "Build Successful!"
            echo "Build Number: ${env.BUILD_NUMBER}"
            echo "Build URL: ${env.BUILD_URL}"
            echo "Current build result: ${currentBuild.result}"

            // Send email on success
            emailext(
                subject: "Build Success - ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "The build was successful!\n\nBuild Number: ${env.BUILD_NUMBER}\nBuild URL: ${env.BUILD_URL}",
                to: 'pranatpattankude143@gmail.com'
            )
        }
    }
    failure {
        script {
            echo "Build Failed!"
            echo "Build Number: ${env.BUILD_NUMBER}"
            echo "Build URL: ${env.BUILD_URL}"
            echo "Current build result: ${currentBuild.result}"

            // Send email on failure
            emailext(
                subject: "Build Failed - ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "The build has failed!\n\nBuild Number: ${env.BUILD_NUMBER}\nBuild URL: ${env.BUILD_URL}",
                to: ''pranatpattankude143@gmail.com'
            )
        }
    }
}

}
