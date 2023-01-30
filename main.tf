terraform {

  cloud {
    organization = "rananthanrayanan_org"

    workspaces {
      name = "learn-tfc-aws"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-026b57f3c383c2eec"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-089247704a345b3d5"]
  subnet_id              = "subnet-0cc572bac1f076425"
  key_name               = "Securedkey"

  tags = {
    Name = var.instance_name
  }
}
