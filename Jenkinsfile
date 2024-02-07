pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    environment {
        PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
        JAVA_HOME = "/path/to/your/jdk17" // Specify the correct JDK path
    }
    stages {
        stage("build") {
            steps {
                echo "----------- build started ----------"
                sh 'mvn clean deploy'
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
