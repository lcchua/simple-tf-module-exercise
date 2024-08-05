module "lcchua-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = var.vpc_name
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

# Note that enable_dns_support and enable_dns_hostnames are defaulted 
# True in the TF Registry VPC module
//  enable_nat_gateway = true
  enable_vpn_gateway      = true
  map_public_ip_on_launch = true

  tags = {
    Terraform = "true"
    Environment = var.env
    Created_by = "lcchua"
    Cohort = "CE7"
  }
}
output "lcchua-vpc-arn" {
  value = module.lcchua-vpc.vpc_arn
}

module "lcchua-http-https-ssh-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = var.sg_name
  description = "Security group for web-server with http-https-ssh ports"
  vpc_id      = module.vpc.vpc_id

  //ingress_cidr_blocks = ["10.10.0.0/16"]
  ingress_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
output "lcchua-http-https-ssh-sg-id" {
  value = module.lcchua-http-https-ssh-sg.security_group_id
}
