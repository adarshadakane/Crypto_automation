terraform {
  backend "s3" {
    bucket = "terraform-eks-bucket1"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-2"
  }
}