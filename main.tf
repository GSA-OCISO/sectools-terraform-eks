terraform {
  backend "s3" {
    bucket = "sectools-terraform-eks-state"
    key    = "tfstate/terraform.tfstate"
    region = "us-east-1"
  } 
}
