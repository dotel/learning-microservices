data "aws_eks_cluster" "myapp_cluster" {
    name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "myapp_cluster" { 
    name = module.eks.cluster_id
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.6.0"
  
  cluster_name = "myapp-eks-cluster"
  cluster_version = "1.17"

  subnets = module.myapp-vpc.private_subnets 
  vpc_id = module.myapp-vpc.vpc_id

  tags = {
      environment = "development"
      application = "myapp"
  }

  worker_groups = [
      {
          instance_type = "t2.micro"
          name = "worker-group-1"
          asg_desired_capacity = 2
      }, 
      {
          instance_type = "t2.micro"
          name = "worker-group-1"
          asg_desired_capacity = 1
      }
  ]
}