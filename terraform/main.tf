terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region    = "${var.region}"
  profile  = "demo"
}

resource "aws_ecr_repository" "kittens" {
  name                 = "kittens_store"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}