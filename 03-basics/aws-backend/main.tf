terraform {
   backend "s3" {
     bucket         = "devops-directive-tf-state-drandredev" # REPLACE WITH YOUR BUCKET NAME
     key            = "03-basics/import-bootstrap/terraform.tfstate"
     region         = "us-east-1"
     dynamodb_table = "terraform-state-locking-drandredev"
     encrypt        = true
   }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "devops-directive-tf-state-drandredev" # REPLACE WITH YOUR BUCKET NAME
  force_destroy = true
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking-drandredev"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}