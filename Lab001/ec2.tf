terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "ACCESS_KEY_HERE"
  secret_key = "SECRET_KEY_HERE"
}

resource "aws_instance" "example_ec2" {
  ami		= "ami-0817d428a6fb68645"
  instance_type = "t2.micro"
}