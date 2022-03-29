terraform {
  backend "remote" {
    organization = "devops-directive-drandredev"

    workspaces {
      name = "devops-directive-terraform-course-drandredev"
    }
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