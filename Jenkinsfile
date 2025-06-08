pipeline {
  agent any

  tools {
    maven 'maven-3.9.9'
    jdk 'jdk-11'
  }

  environment {
    JAR_NAME = 'weather-api-1.0-SNAPSHOT.jar'
    IMAGE_NAME = 'weather-api:latest'
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
        echo "Building Docker image..."
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Deploy') {
      steps {
        echo "Killing old version if running..."
        sh 'pkill -f $JAR_NAME || true'

        echo "Starting app..."
        sh 'nohup java -jar $WORKSPACE/target/weather-api-0.0.1-SNAPSHOT.jar > $WORKSPACE/app.log 2>&1 &'
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