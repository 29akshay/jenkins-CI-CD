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
        sh ("docker login -u $DOCKERHUB_CREDENTIALS_USR -p humancloudak")
      }
    }
    stage('Push') {
      steps {
        sh 'docker push humancloudak/poc1'
      }
    }
    stage('EKS config') {
      steps {
        sh "aws eks update-kubeconfig --name eks-cluster"
      }
    }
    stage('Pull') {
      steps {
        sh 'kubectl apply -f /var/lib/jenkins/workspace/ok/pod1.yml'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
           
