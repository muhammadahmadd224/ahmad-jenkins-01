pipeline {
    agent any

    environment {
        CONTAINER_NAME = "docker-node-app"
        IMAGE_NAME = "node-image"
        EMAIL = "ym833641@gmail.com"
        PORT = "3000"
        GIT_URL = "https://github.com/muhammadahmadd224/ahmad-jenkins-01.git"
    }

    stages {

        stage('Clone Repository') {
            steps {
                echo "Cloning repository..."
                git branch: 'main', url: "${GIT_URL}", credentialsId: 'github-pat'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Stop and Remove Previous Container') {
            steps {
                echo "Stopping and removing previous container if exists..."
                sh '''
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container..."
                sh "docker run -d -p ${PORT}:${PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}"
            }
        }

        stage('Send Email Notification') {
            steps {
                echo "Sending success email..."
                emailext(
                    subject: "Jenkins Deployment Successful",
                    body: """✅ Your Node.js Docker App has been deployed successfully!

<<<<<<< HEAD:Jenkinsfile
                    Application URL: http://18.206.135.160:${PORT}/
                   Jenkins Job: ${env.JOB_NAME}
                    Build Number: ${env.BUILD_NUMBER}
                    Build URL: ${env.BUILD_URL}
=======
Application URL: http://18.206.135.160:${PORT}/
Jenkins Job: ${env.JOB_NAME}
Build Number: ${env.BUILD_NUMBER}
Build URL: ${env.BUILD_URL}
>>>>>>> 9b9ddc6 (tension):jenkinsfile

Regards,
Jenkins CI/CD Pipeline""",
                    to: "${EMAIL}"
                )
            }
        }
    }

<<<<<<< HEAD:Jenkinsfile
  
=======
    post {
        failure {
            echo "Sending failure email..."
            emailext(
                subject: "❌ Jenkins Deployment Failed",
                body: """The Jenkins build has failed.

Job: ${env.JOB_NAME}
Build Number: ${env.BUILD_NUMBER}
Build URL: ${env.BUILD_URL}

Please check the Jenkins console output for details.""",
>>>>>>> 9b9ddc6 (tension):jenkinsfile
                to: "${EMAIL}"
            )
        }
    }
}
