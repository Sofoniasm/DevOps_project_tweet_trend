terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_subnet" "default_subnet" {
  vpc_id                  = "vpc-00e8484ca8cb3c34d"
  cidr_block              = "172.31.48.0/24"
  map_public_ip_on_launch = true
}

resource "aws_instance" "demo-server" {
  ami           = "ami-0df8c184d5f6ae949"
  instance_type = "t2.micro"
  key_name      = "DevOps"
  subnet_id     = aws_subnet.default_subnet.id
}
