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
                // Using '|| rem' prevents Windows cmd from crashing if the container doesn't exist
                bat '''
                docker stop vite-container >nul 2>&1 || rem
                docker rm vite-container >nul 2>&1 || rem
                docker run -d -p 8081:80 --name vite-container vite-app
                '''
            }
        }
    }
}
