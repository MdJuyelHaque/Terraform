pipeline {
  agent any
    tools {
      terraform 'terraform-13'
    }
  environment {
    TF_WORKSPACE = 'name'
    AWS_DEFAULT_REGION = 'us-west-2'
  }
  stages {

    stage('Validation') {
      //def identity = awsIdentity()
      steps {
        //echo ${identity}
        checkout scm

      }
    }

    // Run Terraform init and plan
    stage('Testing') {
      steps {
        sh label: 'tf init', script: 'terraform init'
        sh label: 'refreshing state from s3', script: 'terraform refresh'
        sh label: 'planning build', script:  'terraform plan -out=tfplan -input=false'
      }
    }
    // Run terraform apply
    stage('Deploy') {
      when {
        branch 'main'
      }
      steps {
        sh label: '', script: 'terraform apply -auto-approve tfplan'
        sh label: '', script:  'terraform show'

      }
    }


  }
}
