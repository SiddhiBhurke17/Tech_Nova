pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                echo '🔄 Cloning GitHub Repo...'
                // This happens automatically if you're using "Pipeline from SCM" in Jenkins config
            }
        }

        stage('Lint HTML/CSS') {
            steps {
                echo '🔍 Checking HTML for errors using tidy...'
                sh '''
                sudo apt-get update
                sudo apt-get install -y tidy

                # Validate the HTML file; fail build if errors are found
                tidy -e index.html
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker Image...'
                sh '''
                docker build -t technova-site:latest .
                '''
            }
        }

        // Optional: Add push to Docker Hub here later
    }

    post {
        failure {
            echo '❌ Pipeline failed — check for HTML errors or Docker issues.'
        }
        success {
            echo '✅ Success — Clean HTML, Docker image built!'
        }
    }
}

