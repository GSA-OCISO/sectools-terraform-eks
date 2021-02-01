variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

provider "aws" {
  version = ">= 2.28.1"
  region  = "us-east-1"
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "gsa-ociso-sectools-production-eks"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}
