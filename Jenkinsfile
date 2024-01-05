pipeline {
    agent any

    tools{
        docker 'docker-v'
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

       stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t test .'
                }          
            }
        }
    }
}
  
