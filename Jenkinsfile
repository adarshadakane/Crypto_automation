pipeline {
    agent any

    environment {
        IMAGE_NAME = 'xtrendence/cryptoshare'
        CONTAINER_NAME = 'cryptoshare_container'
        // SONARQUBE_CONTAINER = 'sonarqube_server'
        // SONARQUBE_PORT = '9000'
        PROJECT_PORT = '3190'
        // SONARQUBE_URL = 'http://localhost:9000'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/adarshadakane/Crypto_automation.git'
            }
        }

        // stage('Start SonarQube Server') {
        //     steps {
        //         script {
        //             sh """
        //             docker ps -q --filter "name=${SONARQUBE_CONTAINER}" | grep -q . && echo "SonarQube is already running" || \
        //             docker run -d --name ${SONARQUBE_CONTAINER} -p ${SONARQUBE_PORT}:9000 sonarqube:lts
        //             """
        //         }
        //     }
        // }

        // stage('SonarQube Analysis') {
        //     steps {
        //         script {
        //             withSonarQubeEnv('SonarQube') {
        //                 sh """
        //                 until curl -s ${SONARQUBE_URL} >/dev/null; do echo "Waiting for SonarQube..."; sleep 5; done
        //                 sonar-scanner -Dsonar.projectKey=CryptoShare -Dsonar.sources=. -Dsonar.host.url=${SONARQUBE_URL}
        //                 """
        //             }
        //         }
        //     }
        // }

        stage('Build and Push Docker Image') {  // Renamed stage
            steps {
                script {
                    sh "docker pull ${IMAGE_NAME}"
                }
            }
        }

        // stage('Stop Existing Container') {
        //     steps {
        //         script {
        //             sh """
        //             docker ps -q --filter "name=${CONTAINER_NAME}" | grep -q . && docker stop ${CONTAINER_NAME} || true
        //             docker ps -a -q --filter "name=${CONTAINER_NAME}" | grep -q . && docker rm ${CONTAINER_NAME} || true
        //             """
        //         }
        //     }
        // }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${PROJECT_PORT}:${PROJECT_PORT} ${IMAGE_NAME}"
                }
            }
        }

        // stage('Show EC2 Public DNS') {
        //     steps {
        //         script {
        //             sh "curl http://169.254.169.254/latest/meta-data/public-hostname"
        //         }
        //     }
        // }
    }
}
