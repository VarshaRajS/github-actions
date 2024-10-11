terraform{
  required_providers{
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

# enable static website hosting
  website {
    index_document = "index.html"
  }
}
