module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

# Note that enable_dns_support and enable_dns_hostnames are defaulted 
# True in the TF Registry VPC module
//  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = var.env
    Created_by = "lcchua"
    Cohort = "CE7"
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
output "vpc_arn" {
  value = module.vpc.vpc_arn
}

module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = var.sg_name
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

//  ingress_cidr_blocks = ["10.10.0.0/16"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
}
output "web_server_sg_id" {
  value = module.web_server_sg.security_group_id
}

module "ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"

  name = var.sg_name
  description = "Security group for ssh"
  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
output "ssh_sg" {
  value = module.ssh_sg.security_group_id
}