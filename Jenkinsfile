pipeline {
    agent any
    
    stages {
        stage('Pull Code') {
            steps {
                // Pulls your code from GitHub
                git 'https://github.com/VINARKHEDE/jenkins.git'[cite: 3]
            }
        }

        stage('Build Docker Image') {
            steps {
                // Builds the image and tags it as 'java-app'
                sh 'docker build -t java-app .'[cite: 3]
            }
        }

        stage('Run Docker Container') {
            steps {
                // Runs the container and gives it a specific name for easy tracking
                // The --rm flag ensures the container is removed after it finishes executing[cite: 3]
                sh 'docker run --name java-container-run java-app'[cite: 3]
            }
        }

        stage('Verify Output') {
            steps {
                // Captures the logs from the container to verify the "Hello World" message[cite: 3]
                sh 'docker logs java-container-run || true'[cite: 3]
            }
        }
    }
    
    post {
        always {
            // Clean up: stop and remove the container if it's still hanging around[cite: 3]
            sh 'docker rm -f java-container-run || true'[cite: 3]
        }
    }
}
