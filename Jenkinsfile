pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        AWS_ACCOUNT_ID = 'AKIAXABTDDW5PWZLGC5Y'
        ECR_REPOSITORY = 'ecs-repository-prueba'
        DOCKER_IMAGE_TAG = 'latest'
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

            stage('AWS ECR Login') {
            steps {
                script {
                    def ecrLoginCmd = "aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"
                    sh ecrLoginCmd
                    sh 'docker build -t ecs-repository-prueba .'
                    sh 'docker tag ecs-repository-prueba:latest 481143496122.dkr.ecr.us-east-1.amazonaws.com/ecs-repository-prueba:latest'
                    sh 'docker push 481143496122.dkr.ecr.us-east-1.amazonaws.com/ecs-repository-prueba:latest'
                }
            }
        }
    }
}
  
