module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  cluster_version = "1.18"
  subnets         = var.subnets_private_id
    
  tags = {
    Environment = "production"
    GithubRepo  = "sectools-terraaform-eks"
    GithubOrg   = "gsa-ociso"
  }

  vpc_id = var.vpc_id

  worker_groups = [
    {
      name                          = "sectools-k8s-worker-group"
      instance_type                 = "m4.xlarge"
      additional_userdata           = "GSA OCISO SecTools k8s cluster"
      asg_desired_capacity          = 3
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
