# --- terraform-aws-s3.providers ---

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
