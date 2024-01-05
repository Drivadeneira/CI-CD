pipeline {
    agent any
    environment {
        NODEJS_HOME = tool 'Node-21.5.0'
    }
    stages {
        stage('Build') {
            steps {
                echo "executing npm ..."
                sh 'npm install'
            }
        }
    }
}
