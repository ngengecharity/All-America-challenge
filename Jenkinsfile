pipeline{
    agent any
    tools {
        terraform 'terraform 11'
    }
    parameters {
	string(name: "AWS_ACCESS_KEY",
	       defaultValue: "",
	       description: "Aws_Access_key_id"
    )
    

    string(name: "AWS_SECRET_ACCESS_KEY",
	       defaultValue: "",
	       description: "Aws_secret_key_id"  
    )       
    }
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