pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'vikram0448/sample'
        // REGISTRY_CREDENTIALS = credentials('dockerhub-credentials')
        PATH = "/usr/local/bin:${env.PATH}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/vikramdevops0448/sample-java-application.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh '/opt/homebrew/bin/mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -f Dockerfile ."
                }
            }
        }

        
      /*  stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image('sample-java-app').push('latest')
                    }
                }
            }
            */
    }

    post {
        success {
            echo 'Java application built and Docker image pushed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs!'
        }
    }
}
        



