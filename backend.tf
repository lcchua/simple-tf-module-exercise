terraform {  
  backend "s3" {
    bucket = "sctp-ce7-tfstate" 
    key    = "terraform-module-ex-luqman.tfstate" # Replace the value of key to <your suggested name>.tfstate for example terraform-ex-ec2-<NAME>.tfstate
    region = "us-east-1"
  }
}