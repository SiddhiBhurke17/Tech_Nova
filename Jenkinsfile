pipeline {
    agent any

    environment {
        IMAGE_NAME = 'technova-web-image'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo '🔄 Cloning GitHub Repo...'
                // Jenkins does this automatically when using "Pipeline script from SCM"
            }
        }

        stage('Lint HTML/CSS') {
            steps {
                echo '🔍 Checking HTML for errors using tidy...'
                // Run HTML lint check
                sh 'tidy -q -e index.html'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker Image...'
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed — check for HTML errors or Docker issues.'
        }
    }
}


