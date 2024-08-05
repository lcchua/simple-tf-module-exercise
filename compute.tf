module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = var.ec2_name

  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [module.web_server_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets.id

  tags = {
    Terraform   = "true"
    Environment = var.env
  }
}
output "ec2_tf_module" {
  value = module.ec2_instance.id
}