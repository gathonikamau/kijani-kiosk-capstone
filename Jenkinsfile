pipeline {
    agent any

    environment {
        IMAGE = "kk-payments:${BUILD_NUMBER}"
        PATH = "/usr/local/bin:/usr/bin:/bin"
    }

    stages {

        stage('Verify Tools') {
            steps {
                sh 'docker version'
                sh 'kubectl version --client'
                sh 'kubectl get nodes'
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

        stage('Ensure Namespaces Exist') {
            steps {
                sh '''
                    kubectl get ns kijani-staging || kubectl create ns kijani-staging
                    kubectl get ns production || kubectl create ns production
                '''
            }
        }

        stage('Deploy to Staging') {
            steps {
                sh '''
                    kubectl apply -f k8s/configmap-staging.yaml -n kijani-staging
                    kubectl apply -f k8s/deployment.yaml -n kijani-staging
                '''
            }
        }

        stage('Verify Staging') {
            steps {
                sh 'kubectl get pods -n kijani-staging'
            }
        }

        stage('Smoke Test') {
            steps {
                sh 'echo "curl http://staging.kk-payments/health"'
            }
        }

        stage('Approval Gate') {
            steps {
                input message: "Deploy to production?"
            }
        }

        stage('Deploy to Production') {
            steps {
                sh '''
                    kubectl apply -f k8s/configmap-prod.yaml -n production
                    kubectl apply -f k8s/deployment.yaml -n production
                '''
            }
        }

        stage('Verify Production') {
            steps {
                sh 'kubectl get pods -n production'
            }
        }
    }
}