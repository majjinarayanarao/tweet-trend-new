pipeline {
    agent {
        node {
            label 'maven'
        }
    }

    stages {
        stage('Hello') {
            steps {
                git branch: 'main', url: 'https://github.com/majjinarayanarao/tweet-trend-new.git'
            }
        }
    }
}
