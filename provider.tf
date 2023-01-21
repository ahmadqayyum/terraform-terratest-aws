terraform {

  cloud {
    organization = "learn-with-ahmad"

    workspaces {
      name = "terraform-terratest-aws"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

}
provider "aws" {
  region = "us-east-1"
}