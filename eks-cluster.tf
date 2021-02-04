module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  cluster_name = local.cluster_name
  subnets = var.subnets_private_id
  cluster_version = "1.18"

  tags = {
    Environment = "production"
    GithubRepo  = "sectools-terraform-eks"
    GithubOrg   = "gsa-ociso"
  }

  vpc_id = var.vpc_id

  worker_groups = [
    {
      name                          = "sectools-k8s-worker-group-1"
      instance_type                 = var.instance_type
      additional_userdata           = "GSA OCISO SecTools k8s cluster"
      asg_desired_capacity          = 2
      key_name                      = var.aws_key_name
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
    {
      name                          = "sectools-k8s-worker-group-2"
      instance_type                 = var.instance_type
      additional_userdata           = "GSA OCISO SecTools k8s cluster"
      asg_desired_capacity          = 2
      key_name                      = var.aws_key_name
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
    }
  ]

  workers_group_defaults = {
        root_volume_type = "gp2"
        ami_id = var.ami_id
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
} 
