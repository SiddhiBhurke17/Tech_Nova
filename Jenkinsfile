pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/SiddhiBhurke17/Tech_Nova'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning repo from $GIT_REPO_URL"
                // Automatically uses Jenkins credentials if configured
                checkout scm
            }
        }

        stage('Verify HTML File') {
            steps {
                echo 'Listing HTML files...'
                sh 'ls -l *.html || echo "No HTML files found!"'
            }
        }

        stage('Basic Syntax Check') {
            steps {
                echo 'Performing basic syntax validation...'
                sh 'grep -i "<html" index.html && grep -i "</html>" index.html || echo "Check HTML structure"'
            }
        }

        stage('Simulate Deployment') {
            steps {
                echo 'Simulating deployment...'
                // In real scenarios, you can copy to a web server or Docker image
                sh 'mkdir -p build_output && cp index.html build_output/'
                echo 'Deployed to build_output folder'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Something went wrong. Investigate the logs.'
        }
    }
}

