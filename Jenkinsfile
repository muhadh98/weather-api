pipeline {
  agent any

  tools {
    maven 'Maven-3.9.9'
    
  }

  environment {
    JAR_NAME = 'weather-api-1.0-SNAPSHOT.jar'
    IMAGE_NAME = 'weather-api:latest'
    REGISTRY_IMAGE = 'myregistry/weather-api:latest'
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
        echo "Building Docker image exposing port 8082..."
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Push Docker Image') {
      steps {
        echo "Pushing Docker image to registry..."
        sh 'docker tag $IMAGE_NAME $REGISTRY_IMAGE'
        sh 'docker push $REGISTRY_IMAGE'
      }
    }

    stage('Deploy') {
      steps {
        echo "Killing old version if running..."
        sh 'pkill -f $JAR_NAME || true'

        echo "Starting app on port 8082..."
        sh 'nohup java -jar $WORKSPACE/target/$JAR_NAME --server.port=8082 > $WORKSPACE/app.log 2>&1 &'
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
}