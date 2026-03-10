terraform {
  required_version = "~> 1.14.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project = "Serverlesspresso"
    }
  }
}
