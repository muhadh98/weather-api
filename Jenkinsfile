pipeline {
    agent any

    environment {
        IMAGE_NAME = 'weather-api:latest'
        CONTAINER_NAME = 'weather-api'
        APP_PORT = '8081'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                script {
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${APP_PORT}:8081 ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        success {
            echo "Weather API is running at http://localhost:${APP_PORT}"
        }
        failure {
            echo "Pipeline failed. Check logs."
        }
    }
}