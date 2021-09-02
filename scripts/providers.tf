# Initialises Terraform providers and sets their version numbers.

# Configure the AWS Provider
provider "aws" {
  region = var.location
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

provider "tls" {
}

provider "kubernetes" {
    host = data.aws_eks_cluster.myapp_cluster.endpoint
    token = data.aws_eks_cluster_auth.myapp_cluster.token
    cluster_ca_certificate  = base64decode(data.aws_eks_cluster.myapp_cluster.certificate_authority.0.data)
}

provider "null" {
}


terraform {
  backend "s3" {
    bucket = "test-bucket-dotel"
    key    = "terraform/key"
    region = "us-east-2"
  }
}
