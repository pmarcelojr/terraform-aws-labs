terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  access_key = "ACCESS_KEY_HERE"
  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}

# Microsoft Windows Server 2019 Base
resource "aws_instance" "example" {
  ami           = "ami-0eb7fbcc77e5e6ec6"
  instance_type = "t2.micro"
  key_name = "terraform-key"
  security_groups = ["${aws_security_group.allow_rdp.name}"]

}

resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allow rdp traffic"


  ingress {

    from_port   = 3389 #  TCP port 3389 para RDP
    to_port     = 3389
    protocol =   "tcp"

    cidr_blocks =  ["0.0.0.0/0"]
  }
}