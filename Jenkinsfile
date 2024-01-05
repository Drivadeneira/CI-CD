pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "executing npm ..."
                tool 'Node-21.5.0'
                sh 'npm install'
           }
       }
    }
}









// pipeline {
//     agent any

//     stages {
//         stage('Build') {
//             steps {
//                 script {
//                     // Checkout code from your version control system (e.g., Git)
//                     checkout scm
                                     
//                     // Install dependencies and build your application
//                     ls 
//                     sh 'npm install'
//                 }
//             }
//         }

//         stage('Test') {
//             steps {
//                 script {
//                     // Run your tests here
//                     sh 'npm test'
//                 }
//             }
//         }

//         // stage('Deploy') {
//         //     steps {
//         //         script {
//         //             // Assuming AWS CLI is configured with necessary credentials

//         //             // Authenticate Docker with Amazon ECR
//         //             withCredentials([[$class: 'AmazonECRLogin', awsCredentialsId: 'your-aws-credentials-id', region: 'your-aws-region']]) {
//         //                 sh 'eval $(aws ecr get-login --no-include-email --region your-aws-region)'
//         //             }

//         //             // Build Docker image
//         //             sh 'docker build -t your-ecr-repo-url:latest .'

//         //             // Tag Docker image
//         //             sh 'docker tag your-ecr-repo-url:latest your-ecr-repo-url:latest'

//         //             // Push Docker image to Amazon ECR
//         //             sh 'docker push your-ecr-repo-url:latest'
//         //         }
//         //     }
//         // }
//     }
// }
