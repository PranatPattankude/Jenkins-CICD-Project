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
                def logs = currentBuild.rawBuild.getLog(100)
                emailext(
                    subject: "Build Success: ${currentBuild.fullDisplayName}",
                    body: """
                        The build has completed successfully.

                        ${logs}
                    """,
                    to: "${env.RECIPIENTS}"
                )
            }
        }
        failure {
            script {
                def logs = currentBuild.rawBuild.getLog(100)
                emailext(
                    subject: "Build Failed: ${currentBuild.fullDisplayName}",
                    body: """
                        The build has failed. Please check the logs for more details.

                        ${logs}
                    """,
                    to: "${env.RECIPIENTS}"
                )
            }
        }
    }
}
