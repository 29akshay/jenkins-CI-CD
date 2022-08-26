pipeline {
  agent any
  options { 
    buildDiscarder(logRotator(numToKeepStr:'5'))
  }
  //environment {
  //  DOCKERHUB_CREDENTIALS = credentials('humancloudak')
  //}
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t myimage123 .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDETIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push humancloudak/poc1'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
           
