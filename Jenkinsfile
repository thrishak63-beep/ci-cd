pipeline {
    agent any

    stages {
        stage('Docker Version') {
            steps {
                bat 'docker --version'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build --no-cache -t vite-app .'
            }
        }

        stage('Deploy Container') {
            steps {
                // The || exit 0 stops the build from breaking if the container doesn't exist yet
                bat '''
                docker stop vite-container || exit 0
                docker rm vite-container || exit 0
                docker run -d -p 8081:80 --name vite-container vite-app
                '''
            }
        }
    }
}
