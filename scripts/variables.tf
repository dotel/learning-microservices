# Sets global variables for this Terraform project.

variable app_name {
    default = "flixtube"
}
variable location {
  default = "eu-central-1"
}

variable admin_username {
  default = "linux_admin"
}

variable app_version { 
}

variable aws_secret_access_key {
    type = string 
    description = "Your aws secret key"
} 
variable aws_access_key_id {
    type = string 
    description = "Your aws access key"
} 


variable vpc_cidr_block {
  type = string
  default = "10.0.0.0/16"
} 

variable "private_subnets_cidr_blocks" {
  type = list
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets_cidr_blocks" {
  type = list
  default =  ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

