pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "executing npm  install ..."
                nodejs('Node-21.5.0') {
                    sh 'npm install'
                }
           }
       }

       stage('Test') {
            steps {
                echo "executing npm test ..."
                nodejs('Node-21.5.0') {
                    sh 'npm run test'
                }
           }
       }

       stage('Push to ECR') {
            environment {
                // Step 4: Pushing Docker Image to ECR
                // Replace 'your-aws-region', 'your-ecr-repo-name', and 'your-ecr-registry-id' with your AWS details
                AWS_REGION = 'us-east-1'
                ECR_REPO_NAME = 'ecs-repository-prueba'
                ECR_REGISTRY_ID = '481143496122'
                DOCKER_IMAGE_TAG = "${ECR_REGISTRY_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest"
            }
            steps {
                withCredentials([[$class:'AmazonWebServicesCredentialsBinding', accesKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    // Login to ECR
                    sh "aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
                    
                    // Tag and Push the Docker image to ECR
                    sh "docker build -t ${ECR_REPO_NAME} ."
                    sh "docker tag ${ECR_REPO_NAME}:latest ${DOCKER_IMAGE_TAG}"
                    sh "docker push ${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
}
  
