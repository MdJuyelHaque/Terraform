terraform {
  required_version = "1.2.1"
  
  backend "s3" {
    bucket = "bti-terraform-aws-state"
    key = "ec2-deployment/terraform.tfstate"
    region = "us-west-2"
    
  }
}

provider "aws" {
  profile                 = "default"
  region                  = "us-west-2"
}

resource "aws_instance" "myinstance" {
  instance_type ="t2.micro"
  ami ="ami-0ed984ee7fb7202ea"
  key_name ="test"
  
}
