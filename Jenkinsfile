pipeline {
    agent any

    environment {
        PATH = "$PATH:/opt/apache-maven-3.6.3/bin"
    }

    stages {
        stage('GetCode') {
            steps {
                git 'git@github.com:majjinarayanarao/tweet-trend-new.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarQube-Scanner') {
                    sh "mvn sonar:sonar"
                }
            }
        }
    }
}
