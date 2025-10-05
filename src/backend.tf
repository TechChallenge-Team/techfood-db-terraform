    terraform {
      backend "s3" {
        bucket         = "techfood-ts-bucket"
        key            = "terraform/db-terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
      }
    }