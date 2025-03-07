pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'vikram0448/sample-java-app'
        REGISTRY_CREDENTIALS = credentials('dockerhub-credentials')
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
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dockerhub-credentials', url: '']) {
                        sh "docker push $DOCKER_IMAGE"
                    }
                }
            }
        }
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



