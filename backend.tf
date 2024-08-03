terraform {  
  backend "s3" {
    bucket = "sctp-ce7-tfstate" 
    key    = "terraform-module-ex-lcchua.tfstate"
    region = "us-east-1"
  }
}