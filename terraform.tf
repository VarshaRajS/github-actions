terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure AWS provider (credentials will be provided through environment variables)
provider "aws" {
  region = "us-east-1"
}

# Create the S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Enable static website hosting as a separate resource
resource "aws_s3_bucket_website_configuration" "my_bucket_website" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }
}

# Create and attach bucket policy
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "PublicReadGetObject",
        Effect   = "Allow",
        Principal = "*",
        Action   = "s3:GetObject",
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}

# Output the bucket website URL
output "bucket_website_url" {
  value = "http://${aws_s3_bucket.my_bucket.bucket}.s3-website-${var.region}.amazonaws.com/"
}








