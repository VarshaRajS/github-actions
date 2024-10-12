variable "region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-west-1"  
}

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
  region = "us-west-1"
}

# Create the S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-test-bucket-1709200316042000-bd"

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

# Disable Block Public Access
resource "aws_s3_bucket_public_access_block" "my_bucket_public_access_block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Create and attach bucket policy
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Principal = {
          "AWS": [
            "arn:aws:iam::767398111149:user/github-actions"
          ]
        },
        Action   = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::my-test-bucket-1709200316042000-bd",
          "arn:aws:s3:::my-test-bucket-1709200316042000-bd/*"
        ]
      }
    ]
  })
}

# Output the bucket website URL
output "bucket_website_url" {
  value = "http://${aws_s3_bucket.my_bucket.bucket}.s3-website-${var.region}.amazonaws.com/"
}








