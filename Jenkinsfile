pipeline {
  agent {
    docker {
      image 'abhishekf5/maven-abhishek-docker-agent:v1'
      args '--user root -v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket to access the host's Docker daemon
    }
  }
  stages {
    stage('Checkout') {
      steps {
        sh 'echo passed' // Just a placeholder command, you can remove or replace it
        git branch: 'main', url: 'https://github.com/iam-veeramalla/Jenkins-Zero-To-Hero.git'
      }
    }
    stage('Build and Test') {
      steps {
        sh 'ls -ltr' // Just a diagnostic command to list files in the current directory
        // Build the project and create a JAR file
        sh 'cd tweet-trend-new && mvn clean package'
      }
    }
    stage('Static Code Analysis') {
      environment {
        SONAR_URL = "http://34.201.116.83:9000" // Define SonarQube server URL
      }
      steps {
        // Retrieve SonarQube authentication token from Jenkins credentials
        withCredentials([string(credentialsId: 'sonarqube', variable: 'jenkins')]) {
          // Execute Maven SonarQube analysis
          sh 'cd tweet-trend-new  && mvn sonar:sonar -Dsonar.login=$SONAR_AUTH_TOKEN -Dsonar.host.url=${SONAR_URL}'
        }
      }
    }
  }
}
