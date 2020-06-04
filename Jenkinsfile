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
                bat "docker build --build-arg APP_NAME=demo -t 235190073377.dkr.ecr.us-east-1.amazonaws.com/demo:latest ."
             }
        }
        stage('Docker push') {
            steps {
                bat docker.withRegistry('https://235190073377.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:Demo') {
                bat "docker push 235190073377.dkr.ecr.us-east-1.amazonaws.com/demo:latest"
            }
          }
          stage('Terraform Apply'){
			steps{
		            bat "terraform init"
		            bat "terraform apply -auto-approve"	
	   }  
        }
    }
}
