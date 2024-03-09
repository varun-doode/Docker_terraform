pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = "us-east-2"
    }
    
    stages {
        stage('Checkout') {
            steps {
                sh 'rm -rf Docker_terraform'
                sh 'git clone https://github.com/varun-doode/Docker_terraform.git Docker_terraform'
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
                        sh 'terraform plan'
                    }
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                dir('Docker_terraform/terra') {
                    script {
                        sh 'terraform apply'
                    }
                }
            }
        }
    }
}
