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

module "modified_network" {
  source = "./modules/network"

  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.1.0/24"
}

module "sg" {
  source = "./modules/security_group"

  vpc_id = module.modified_network.vpc_id
}

moved {
  from = module.network
  to   = module.modified_network
}
