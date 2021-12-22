terraform {
  required_providers {
    aws = {
      source  = "aws"
      version = "= 3.70.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

module "network" {
  source = "./modules/network"

  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.1.0/24"
}

module "sg" {
  source = "./modules/security_group"

  vpc_id = module.network.vpc_id
}
