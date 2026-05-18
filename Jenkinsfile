pipeline {
    agent any

    environment {
        IMAGE = "kk-payments:${BUILD_NUMBER}"
        PATH = "/usr/local/bin:/opt/homebrew/bin:/bin:/usr/bin"
    }

    options {
        timeout(time: 15, unit: 'MINUTES')
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {

        stage('Debug Environment') {
            steps {
                sh 'echo "Running as: $(whoami)"'
                sh 'echo "PATH: $PATH"'
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

        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }

        stage('Push Image') {
            steps {
                sh 'echo "Simulating image push..."'
            }
        }

        stage('Deploy to Staging') {
            steps {
                sh 'kubectl apply -f k8s/configmap-staging.yaml -n kijani-staging'
                sh 'kubectl apply -f k8s/deployment.yaml -n kijani-staging'
            }
        }

        stage('Verify Staging Deployment') {
            steps {
                sh 'kubectl get pods -n kijani-staging'
            }
        }

        stage('Smoke Test') {
            steps {
                sh 'echo "Running smoke tests against staging environment..."'
                sh 'kubectl get svc -n kijani-staging'
            }
        }

        stage('Approval Gate') {
            steps {
                input message: 'Promote deployment to production?'
            }
        }

        stage('Deploy to Production') {
            steps {
                sh 'kubectl apply -f k8s/configmap-prod.yaml -n production'
                sh 'kubectl apply -f k8s/deployment.yaml -n production'
            }
        }

        stage('Verify Production Deployment') {
            steps {
                sh 'kubectl get pods -n production'
            }
        }
    }

    post {

        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }

        always {
            echo 'Pipeline execution finished.'
        }
    }
}