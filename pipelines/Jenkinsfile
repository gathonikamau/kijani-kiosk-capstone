pipeline {
  agent any

  environment {
    IMAGE = "kk-payments:${BUILD_NUMBER}"
    PATH = "/usr/local/bin:/opt/homebrew/bin:/bin:/usr/bin"
  }

  stages {

    stage('Debug Environment') {
      steps {
        sh 'whoami'
        sh 'echo $PATH'
        sh 'which kubectl || true'
        sh 'kubectl version --client || true'
      }
    }

    stage('Check kubectl') {
      steps {
        sh 'which kubectl'
        sh 'kubectl version --client'
      }
    }

    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Image') {
      steps {
        sh 'docker build -t $IMAGE .'
      }
    }

    stage('Push Image') {
      steps {
        sh 'echo "Pushing image..."'
      }
    }

    stage('Deploy to Staging') {
      steps {
        sh 'kubectl apply -f k8s/configmap-staging.yaml -n kijani-staging'
        sh 'kubectl apply -f k8s/deployment.yaml -n kijani-staging'
      }
    }

    stage('Smoke Test') {
      steps {
        sh 'echo "curl http://staging.kk-payments/health"'
      }
    }

    stage('Approval Gate') {
      steps {
        input message: "Promote to production?"
      }
    }

    stage('Deploy to Production') {
      steps {
        sh 'kubectl apply -f k8s/configmap-prod.yaml -n production'
        sh 'kubectl apply -f k8s/deployment.yaml -n production'
      }
    }
  }
}