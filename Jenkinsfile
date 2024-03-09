pipeline {
    agent any
  
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = "ap-south-1"
    }
    
    stages {
        stage('Checkout') {
            steps {
              sh 'rm -rf Docker_terraform'
              git 'https://github.com/varun-doode/Docker_terraform.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
              dir('Docker_terraform') {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
              dir('Docker_terraform')
                script {
                    sh 'terraform plan -auto-approve'
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
