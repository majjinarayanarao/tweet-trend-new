pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    environment {
        PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
    }
    stages {
        stage("Build") {
            steps {
                echo "----------- Build started ----------"
                sh 'mvn clean deploy -e -X'
                echo "----------- Build completed ----------"
            }
        }
        stage('SonarQube Analysis') {
            environment {
                scannerHome = tool 'SonarQube_Scanner'
            }
            steps {
                withSonarQubeEnv('SonarQubeinstallations') { 
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
    }
}
