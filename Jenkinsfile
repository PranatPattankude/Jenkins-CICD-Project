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
            emailext(
                subject: "Build Success: ${currentBuild.fullDisplayName}",
                body: """
                    The build has completed successfully.
                    
                    ${BUILD_LOG, max=100}  // Include build log in email
                """,
                to: "${env.RECIPIENTS}"
            )
        }
        failure {
            emailext(
                subject: "Build Failed: ${currentBuild.fullDisplayName}",
                body: """
                    The build has failed. Please check the logs for more details.
                    
                    ${BUILD_LOG, max=100}  // Include build log in email
                """,
                to: "${env.RECIPIENTS}"
            )
        }
    }
}
