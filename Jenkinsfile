pipeline {
    agent {
        node {
            label 'maven'
        }
    }

    stages {
        stage('clone-code') {
            steps {
                git branch: 'mo', url: 'https://github.com/majjinarayanarao/tweet-trend-new.git'
            }
        }
    }
}
