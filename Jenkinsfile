pipeline {
    agent any
       
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/varun-doode/Docker_terraform.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                dir('Docker_terraform/terra') {
                    script {
                        sh 'terraform init'
                    }
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                dir('Docker_terraform/terra') {
                    script {
                        sh 'terraform plan -out=tfplan'
                    }
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                dir('Docker_terraform/terra') {
                    script {
                        sh 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
    }
}
