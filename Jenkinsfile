pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    environment {
        PATH = "/opt/apache-maven-3.9.2/bin:$PATH"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/iam-veeramalla/Jenkins-Zero-To-Hero.git'
            }
        }

        stage('Build and Test') {
            steps {
                dir('tweet-trend-new') {
                    sh 'mvn -f pom.xml clean install'
                }
            }
        }

        stage('Static Code Analysis') {
            environment {
                SONAR_URL = "https://sonarcloud.io/"
            }
            steps {
                withCredentials([string(credentialsId: 'sonarqube', variable: 'jenkins')]) {
                    dir('tweet-trend-new') {
                        sh "mvn sonar:sonar -Dsonar.login=$SONAR_AUTH_TOKEN -Dsonar.host.url=$SONAR_URL"
                    }
                }
            }
        }
    }
}
