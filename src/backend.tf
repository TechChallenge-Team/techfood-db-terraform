terraform {
  backend "s3" {
    key     = "terraform/db-terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
