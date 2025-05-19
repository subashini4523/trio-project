pipeline {
    agent any
    stages {
        stage('Clone Code') {
            steps {
                git 'https://github.com/your-username/your-repo'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t trio-app:latest .'
            }
        }
        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker tag trio-app:latest $USER/trio-app:latest'
                    sh 'docker push $USER/trio-app:latest'
                }
            }
        }
        stage('Deploy to K8s') {
            steps {
                sh 'kubectl apply -f k8s/'
            }
        }
    }
}
