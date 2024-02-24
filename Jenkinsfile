pipeline {
  agent any
  
  stages {
    stage('Checkout') {
      steps {
        // Checkout the code from the specified repository and branch
        git branch: 'main', url: 'https://github.com/iam-veeramalla/Jenkins-Zero-To-Hero.git'
      }
    }
    
    stage('Build and Test') {
      steps {
        // Navigate to the project directory and build the project
        dir('tweet-trend-new') {
          sh 'mvn clean package'
        }
      }
    }
    
    stage('Static Code Analysis') {
      environment {
        SONAR_URL = "https://sonarcloud.io/" // Define SonarQube server URL
      }
      steps {
        // Retrieve SonarQube authentication token from Jenkins credentials
        withCredentials([string(credentialsId: 'sonarqube', variable: 'jenkins')]) {
          // Execute Maven SonarQube analysis
          dir('tweet-trend-new') {
            sh "mvn sonar:sonar -Dsonar.login=$SONAR_AUTH_TOKEN -Dsonar.host.url=$SONAR_URL"
          }
        }
      }
    }
  }
}
