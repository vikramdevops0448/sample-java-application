pipeline {
    agent { label 'docker-agent' }

    environment {
        DOCKER_IMAGE = 'vikram0448/sample'
        /*REGISTRY_CREDENTIALS = credentials('dockerhub-credentials')*/
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
                   sh  "docker build -f Dockerfile ."
                }
            }
        }
        stage('Push Docker Image') {
            environment {
                DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'  // ID of Docker Hub credentials in Jenkins
            }
            steps {
                script {
                    withDockerRegistry([ credentialsId: DOCKER_CREDENTIALS_ID, url: 'https://index.docker.io/v1/' ]) {
                        sh '''
                            echo "Pushing Docker image..."
                            docker push $DOCKER_IMAGE:latest
                        '''
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



