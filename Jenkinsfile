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
        stage("build") {
            steps {
                echo "----------- build started ----------"
                sh 'mvn clean deploy '
                echo "----------- build completed ----------"
            }
        }
        stage('SonarQube analysis') {
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
