terraform {
  required_providers {
    aws = {
      version =">=4.9.0"
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  access_key = ${{ secrets.AWS_CLI_ACCESS }}
  secret_key = ${{ secrets.AWS_SECRET_CLI_ACCESS }}
  region = "ap-southeast-2"
}