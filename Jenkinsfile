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
        stage('build') {
            steps {
                sh 'mvn clean deploy'
            }
        }
        stage('SonarQube analysis') {
            steps {
                script {
                    withSonarQubeEnv('SonarQubeinstallations') {
                        // Set SonarQube properties
                        def scannerHome = tool 'SonarQube_Scanner';
                        withEnv(["PATH+MAVEN=${scannerHome}/bin"]) {
                            sh """
                                sonar-scanner \
                                -Dsonar.verbose=true \
                                -Dsonar.organization=mnr143-key \
                                -Dsonar.projectKey=mnr143-key_maa \
                                -Dsonar.projectName=maa \
                                -Dsonar.language=java \
                                -Dsonar.sourceEncoding=UTF-8 \
                                -Dsonar.sources=. \
                                -Dsonar.java.binaries=target/classes \
                                -Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml
                            """
                        }
                    }
                }
            }
        }
    }
}
