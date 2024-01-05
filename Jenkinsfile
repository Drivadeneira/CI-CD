pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-credentials').accessKey
        AWS_SECRET_ACCESS_KEY = credentials('aws-credentials').secretKey
        AWS_DEFAULT_REGION    = 'us-east-1'
        ECR_REGISTRY          = '481143496122.dkr.ecr.your-aws-region.amazonaws.com'
        IMAGE_NAME            = 'ecs-repository-prueba'
        IMAGE_TAG             = 'latest'
    }

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

            stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t $ECR_REGISTRY/$IMAGE_NAME:$IMAGE_TAG ."

                    // Authenticate Docker to ECR
                    withCredentials([usernamePassword(credentialsId: 'aws-credentials-id', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh "aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $ECR_REGISTRY"
                    }

                    // Push Docker image to ECR
                    sh "docker push $ECR_REGISTRY/$IMAGE_NAME:$IMAGE_TAG"
                }
            }
        }
    }
}
  
