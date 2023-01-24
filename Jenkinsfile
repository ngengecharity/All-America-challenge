pipeline{
    agent any
    tools {
        terraform 'terraform 11'
    }
    parameters {
	    string(name: "AWS_ACCESS_KEY",
	       defaultValue: "",
	       description: "Enter your AWS Access Key Here" )

        string(name: "AWS_SECRET_ACCESS_KEY",
	       defaultValue: "",
	       description: "Enter Your AWS Secret key Here" )

        string(name: "ENVIRONMENT_NAME",
	       defaultValue: "",
	       description: "Enter your environment name" ) 

        string(name: "JENKINS_IP",
	       defaultValue: "",
	       description: "Enter your Jenkins server ip address" )  
    }

    //stages{
        //stage('Git checkout'){
            //steps{
                //git credentialsId: 'Jenkins_Github-token', url: 'https://github.com/AndrewBanin/Terraform-Modulesproject.git'
           // }
        //}  
    //}
    
    stages{
        stage('envsubst'){
            steps{
                sh 'envsubst < variables.tf > variables'
                sh 'rm -rf variables.tf '
                sh 'mv variables variables.tf'
                sh 'envsubst < modules/networking/main.tf > modules/networking/main'
                sh 'rm -rf modules/networking/main.tf '
                sh 'mv modules/networking/main modules/networking/main.tf'
            }
        }      
        stage('terraform init'){
            steps{
                sh 'terraform init'
            }
        }  
        stage('terraform apply'){
            steps{
                sh 'terraform apply --auto-approve'
                sh 'cat ${ENVIRONMENT_NAME}key.pem'
            }
        }
    }
}