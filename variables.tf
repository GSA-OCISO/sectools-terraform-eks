variable "aws_key_name" {
  type = string
  description = "aws ec2 key name used to authenticate"
}

variable "subnets_private_id" {
  type    = list(string)
  description = "List of Subnet ID for EC2 instances - must cross 2 AZs due to EKS requirements"
}

variable "vpc_id" {
  type = string
  description = "ID of the VPC "
}
