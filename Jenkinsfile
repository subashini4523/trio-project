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
                sh 'docker build -t jenifer-app:latest .'
            }
        }
        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker tag jenifer-app:latest $USER/jenifer-app:latest'
                    sh 'docker push $USER/jenifer-app:latest'
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
