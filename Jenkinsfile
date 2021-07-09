pipeline{
    agent any
    parameters{
        string(defaultValue: 'eu-central-1', name: 'REGION')
        string(name: 'DOCKER_TAG')
    }

    stages{
        stage("Docker build"){
            steps{
                    sh "docker build -t 738757238296.dkr.ecr.eu-central-1.amazonaws.com/frontend:${params.DOCKER_TAG} ." 
                }
            }
        stage("Docker push"){
            steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS_KEYS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh "aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 738757238296.dkr.ecr.eu-central-1.amazonaws.com"
                    sh "docker push 738757238296.dkr.ecr.eu-central-1.amazonaws.com/frontend:${params.DOCKER_TAG}"    
                }
            }

        }
    }

    post{
        success{
            echo "Docekr image has been pushed with docker tag :${params.DOCKER_TAG}"
        }
        failure{
            echo "Build is failed. Check Dockerfile and try again."
        }
    }
}