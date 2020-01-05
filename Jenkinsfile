pipeline {
     agent  any  //{ label 'java' } 
    stages {
        stage('Build') { 
            steps {
              sh "terraform init"
            }
        }
        stage('Test') { 
            steps {
               sh "terraform validate"
            }
        }
        stage('package') { 
            steps {
                sh " terraform plan " 
            }
        }
        stage('deploy'){
            steps{
              echo "ready to create your infrastructure in the cloud"
              sh "terraform apply -auto-approve"
            }
        }
       stage('destroy'){
            steps{
              echo "ready to create your infrastructure in the cloud"
              sh "terraform destroy -auto-approve"
            }
        }
    }
}
