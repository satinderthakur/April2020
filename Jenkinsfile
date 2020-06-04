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
                docker.withRegistry('https://235190073377.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:Demo') {
                bat "docker push 235190073377.dkr.ecr.us-east-1.amazonaws.com/bttrm-receipt-consumer:latest"
            }
          }
        }
    }
}
