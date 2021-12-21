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
