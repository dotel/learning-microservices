# Initialises Terraform providers and sets their version numbers.

# Configure the AWS Provider
provider "aws" {
  region = var.location
  access_key = var.access_key
  secret_key = var.secret_key
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
