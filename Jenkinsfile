pipeline{
    agent any
    tools {
        terraform 'terraform 11'
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_access_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_access_secret_id')
        AWS_DEFAULT_REGION = ('us-east-1')
    }
    stages{
        stage('Git checkout'){
            steps{
                git credentialsId: 'github_token_access', url: 'https://github.com/ngengecharity/All-America-challenge.git'
            }
        }  
    }
    
    stages{
        stage('envsubst'){
            steps{
                sh 'envsubst < variables.tf > variables'
                sh 'rm -rf variables.tf '
                sh 'mv variables variables.tf'
            }
        }  
    }    

    stages{
        stage('terraform init'){
            steps{
                sh 'terraform init'
            }
        }  
    }

    stages{
        stage('terraform apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }
}