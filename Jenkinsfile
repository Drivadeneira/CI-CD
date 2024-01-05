pipeline {
    agent any
    environment {
        NODEJS_HOME = tool 'Node-21.5.0'
        PATH = "${env.NODEJS_HOME}/bin:${env.PATH}"
        NPM_HOME = sh(script: 'npm config get prefix', returnStdout: true).trim()
        PATH = "${env.NPM_HOME}/bin:${env.PATH}"
    }
    stages {
        stage('Build') {
            steps {
                echo "executing npm ..."
                sh "which node"
                tool 'Node-21.5.0'
                sh 'npm install'
            }
        }
    }
}
