variable "s3bucketname" {
  description = "The name of the S3 bucket created"
  type        = string
  default     = "lcchua-s3-030820241537"
}

variable "env" {
  description = "The env of the S3 bucket"
  type        = string
  default     = "dev"
}

variable "department" {
  description = "The Department of the S3 bucket owner"
  type        = string
  default     = "DevOps"
}

variable "vpc_name" {
  description = "The VPC Name to use"
  type        = string
  default     = "lcchua-tf-vpc"
}

variable "subnet_name" {
  description = "The Subnet Name to use"
  type        = string
  default     = "lcchua-tf-public-subnet-az1"
}

variable "sg_name" {
  description = "The SG Name to create SG with"
  type        = string
  default     = "lcchua-sg-allow-http-https-ssh-from-anywhere-tf-module"
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0427090fd1714168b"
}

variable "ec2_name" {
  description = "Name of EC2"
  type        = string
  default     = "lcchua-ec2-from-tf-module"
}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of EC2 Key Pair"
  type        = string
  default     = "lcchua-useast1-30072024"
}