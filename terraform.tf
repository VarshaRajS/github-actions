terraform{
  required_providers{
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.0"
    }
  }
}

# configure aws provider
provider "aws" {
  region = "us-east-1"
}

# creating the s3 bucket
resource "aws_s3_bucket" "my_bucket" {
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

# creating and attaching bucket ploicy
resource "aws_s3_bucket_policy" "my_bucket_policy" {
bucket = aws_s3_bucket.my_bucket.id

policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "PublicReadGetObject"
        Effect   = "Allow"
        Principal = "*"
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}

# Output the bucket website URL
output "bucket_website_url" {
  value = aws_s3_bucket.my_bucket.website_endpoint
}









