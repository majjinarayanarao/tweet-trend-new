pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    stages {
        stage('clone') {
            steps {
                git branch: 'new', url: 'https://github.com/majjinarayanarao/tweet-trend-new.git'
            }
        }
    }
}
