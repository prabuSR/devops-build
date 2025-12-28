pipeline {
    agent any

    environment {
        DOCKERHUB_CREDS = credentials('dockerhub-creds')
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Push Image') {
            steps {
                sh '''
                  echo "Branch: $BRANCH_NAME"
                  docker login -u $DOCKERHUB_CREDS_USR -p $DOCKERHUB_CREDS_PSW
                  chmod +x build.sh
                  ./build.sh
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                  chmod +x deploy.sh
                  ./deploy.sh
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully for $BRANCH_NAME"
        }
        failure {
            echo "Pipeline failed for $BRANCH_NAME"
        }
    }
}
