pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "executing npm ..."
                tool 'Node-21.5.0'
                sh 'npm i'
           }
       }
    }
}
