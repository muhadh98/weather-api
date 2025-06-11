pipeline {
  agent { any }

  tools {
    maven 'Maven-3.9.9'
  }

  environment {
    JAR_NAME = 'weather-api-1.0-SNAPSHOT.jar'
    IMAGE_NAME = 'weather-api:latest'
    REGISTRY_IMAGE = 'myregistry/weather-api:latest'
    CONTAINER_NAME = 'weather-api-app'
    APP_PORT = '8082'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/muhadh98/weather-api.git'
        echo "Checked out the main branch of the repository."
      }
    }

    stage('Build') {
      steps {
        sh 'mvn clean package -DskipTests'
      }
    }

    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }

    stage('Build Docker Image') {
      steps {
        echo "Building Docker image exposing port $APP_PORT..."
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Push Docker Image') {
  steps {
    echo "Pushing Docker image to registry..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
      sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
      sh 'docker tag $IMAGE_NAME $REGISTRY_IMAGE'
      sh 'docker push $REGISTRY_IMAGE'
      sh 'docker logout'
    }
  }
}

    stage('Deploy to Docker') {
      steps {
        echo "Stopping and removing old container if exists..."
        sh 'docker stop $CONTAINER_NAME || true'
        sh 'docker rm $CONTAINER_NAME || true'

        echo "Running new Docker container on port $APP_PORT..."
        sh 'docker run -d --name $CONTAINER_NAME -p $APP_PORT:8082 $IMAGE_NAME'
      }
    }

    stage('Cleanup') {
      steps {
        echo "Cleaning up workspace..."
        sh 'mvn clean'
      }
    }
  }

  post {
    success {
      echo 'Pipeline completed successfully!'
    }
    failure {
      echo 'Pipeline failed. Check logs.'
    }
  }
}stage('Push Docker Image') {
  steps {
    echo "Pushing Docker image to registry..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
      sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
      sh 'docker tag $IMAGE_NAME $REGISTRY_IMAGE'
      sh 'docker push $REGISTRY_IMAGE'
      sh 'docker logout'
    }
  }
}stage('Push Docker Image') {
  steps {
    echo "Pushing Docker image to registry..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
      sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
      sh 'docker tag $IMAGE_NAME $REGISTRY_IMAGE'
      sh 'docker push $REGISTRY_IMAGE'
      sh 'docker logout'
    }
  }
}stage('Push Docker Image') {
  steps {
    echo "Pushing Docker image to registry..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
      sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
      sh 'docker tag $IMAGE_NAME $REGISTRY_IMAGE'
      sh 'docker push $REGISTRY_IMAGE'
      sh 'docker logout'
    }
  }
}stage('Push Docker Image') {
  steps {
    echo "Pushing Docker image to registry..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
      sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
      sh 'docker tag $IMAGE_NAME $REGISTRY_IMAGE'
      sh 'docker push $REGISTRY_IMAGE'
      sh 'docker logout'
    }
  }
}