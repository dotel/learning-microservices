# Initialises Terraform providers and sets their version numbers.

# Configure the AWS Provider
provider "aws" {
  region = var.location
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
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
    access_key = "AKIAQQYHEAMWWMGYUNQK"
    secret_key = "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"
  }
}