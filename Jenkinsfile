pipeline {
    agent any

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy infrastructure instead of applying changes?')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = "us-east-2"
    }

    stages {
        stage('Checkout') {
            steps {
                sh 'rm -rf Docker_terraform' 
                sh 'git clone "https://github.com/varun-doode/Docker_terraform.git"'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('Docker_terraform/terraform') {
                    script {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('Docker_terraform/terraform') {
                    script {
                        sh "terraform plan -input=false -out=tfplan"
                        sh 'terraform show -no-color tfplan > tfplan.txt'
                    }
                }
            }
        }
        
        stage('Approval') {
            when {
                not { equals expected: true, actual: params.autoApprove }
                not { equals expected: true, actual: params.destroy }
            }
            steps {
                script {
                    def plan = readFile 'assignment-docker/terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                          parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }
        
        stage('Apply') {
            when {
                not { equals expected: true, actual: params.destroy }
            }
            steps {
                dir('assignment-docker/terraform') {
                    sh 'terraform apply -input=false tfplan'
                }
            }
        }
        
        stage('Destroy') {
            when {
                expression { params.destroy }
            }
            steps {
                input message: 'Do you want to destroy the infrastructure?',
                      ok: 'Destroy'
                dir('assignment-docker/terraform') {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}
