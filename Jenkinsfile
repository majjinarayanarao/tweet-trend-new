pipeline{

agent any

environment {

PATH = "$PATH:/opt/apache-maven-3.6.3/bin"

}

stages{

stage('GetCode'){

steps{

git 'https://github.com/ashokitschool/maven-web-app.git'

}

}

stage('Build'){

steps{

sh 'mvn clean package'

}

}

stage('SonarQube analysis') {

steps{

with SonarQubeFny/Sonar Server-7 81

sh "mvn sonar:sonar
}
}
}
}
