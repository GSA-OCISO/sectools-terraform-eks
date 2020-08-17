variable "aws_key_name" {
  type = string
  description = "aws ec2 key name used to authenticate"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
}

variable "subnets_private_id" {
  type    = list(string)
  description = "List of Subnet ID for EC2 instances - must cross 2 AZs due to EKS requirements"
}

variable "vpc_id" {
  type = string
  description = "ID of the VPC "
}

variable "subnet_id" {
  type = string
  description = "ID of instance subnet "
}

variable "cidr_block_worker_group_1" {
  type    = list(string)
  description = "List of CIDR blocks needing access to Worker Group 1"
}

variable "cidr_block_worker_group_2" {
  type    = list(string)
  description = "List of CIDR blocks needing access to Worker Group 2"
}

variable "cidr_block_all_workers" {
  type    = list(string)
  description = "List of CIDR blocks needing access to all Worker Groups"
}
