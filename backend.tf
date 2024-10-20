terraform {
  backend "s3" {
    bucket         = "varsha-terraform-states"
    key            = "varsha/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
  }
  required_version = ">= 0.12"
}