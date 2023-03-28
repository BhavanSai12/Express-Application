pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }

    stage('Test') {
      steps {
        sh 'npm test'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t express-demo .'
      }
    }

    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
          sh "docker login -u ${env.DOCKERHUB_USERNAME} -p ${env.DOCKERHUB_PASSWORD}"
        }

        sh 'docker push <your-dockerhub-username>/express-demo'
      }
    }

    stage('Deploy') {
      environment {
        NODE_ENV = 'production'
      }
      steps {
        sh 'docker-compose up -d'
      }
    }
  }
}
