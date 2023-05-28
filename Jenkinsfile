pipeline{
    agent {
        label 'slave-1'
    }

    stages {
        stage("Verify Branch"){
            steps {
                echo "$GIT_BRANCH"
            }
        }
        stage("CI"){
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_credentials',usernameVariable: 'DOCKER_USERNAME',passwordVariable: 'DOCKER_PASS')]){
                  sh 'docker build . -t elmansey/simple-app'
                  sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USERNAME  --password-stdin'
                  sh 'docker push elmansey/simple-app'
                }
            }
        }
        stage("CD") {
            steps {
                dir('./DeploymentFiles') {
                    script {
                        sh """ 
                            kubectl apply -f namespace.yaml
                            kubectl apply -f simple-app-deployment.yaml
                            kubectl apply -f simple-app-service.yaml
                        """
                    }
                } 

            }
        }
    }
}