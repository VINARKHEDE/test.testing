pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                // Pulls your code from GitHub
                git 'https://github.com/VINARKHEDE/jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Builds the image and tags it as 'java-app'
                sh 'docker build -t java-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Remove existing container if it exists to avoid 'Name already in use' errors
                sh 'docker rm -f java-container-run || true'
                
                // Run the container (foreground mode captures output to console)
                sh 'docker run --name java-container-run java-app'
            }
        }

        stage('Verify Output') {
            steps {
                // Explicitly fetch logs (useful if previous stage was run in background)
                sh 'docker logs java-container-run || true'
            }
        }
    }

    post {
        always {
            // Clean up: stop and remove the container regardless of build result
            sh 'docker rm -f java-container-run || true'
        }
    }
}
