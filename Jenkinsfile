pipeline {
  agent any
    tools {
      terraform 'terraform-13'
    }
  environment {
    AWS_ACCESS_KEY_ID     = credentials('Access_key_ID')
    AWS_SECRET_ACCESS_KEY = credentials('Secret_access_key')
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
        sh label: 'tf init', script: 'terraform init -backend-config="profile=default"'
        //sh label: 'refreshing state from s3', script: 'terraform refresh'
        sh label: 'planning build', script:  'terraform plan -out=tfplan -input=false'
      }
    }
    // Run terraform apply
    stage('Deploy') {
     // when {
       // branch 'main'
      //}
      steps {
        sh label: '', script: 'terraform apply -auto-approve tfplan'
        sh label: '', script:  'terraform show'

      }
    }


  }
}
