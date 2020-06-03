pipeline {
    agent any
     stages {
        stage('Build') {
            steps {
                bat "mvn clean"
        
            }
        }
        stage('Test') {
            steps {
                bat "mvn test"
            }
        }
        stage('Build Docker') {
            steps {
                bat "docker build -t Demo ."
             }
        }
        stage('Docker push') {
            steps {
                bat "docker (Get-ECRLoginCommand).Password | docker login --username AWS --password-stdin 235190073377.dkr.ecr.us-east-1.amazonaws.com
                bat "docker tag demo:latest 235190073377.dkr.ecr.us-east-1.amazonaws.com/demo:latest"
                bat "docker push 235190073377.dkr.ecr.us-east-1.amazonaws.com/demo:latest"
          }
        }
    }
}
