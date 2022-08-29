pipeline {
  agent any
  options { 
    buildDiscarder(logRotator(numToKeepStr:'5'))
  }
  environment {
   DOCKERHUB_CREDENTIALS = credentials("a55077d1-ddc9-4446-8609-dfdb8af68313")
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t myimage123 .'
      }
    }
    stage('Login') {
      steps {
        //sh 'echo $DOCKERHUB_CREDETIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        sh("docker login -u $DOCKERHUB_CREDENTIALS_USR -p ${DOCKERHUB_CREDETIALS_PSW}")
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
           
