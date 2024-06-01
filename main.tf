# Creation of S3 bucket
resource "aws_s3_bucket" "mbucket" {
  bucket = var.bucketName
}

# Having the ownership of the bucket
resource "aws_s3_bucket_ownership_controls" "mbucket" {
  bucket = aws_s3_bucket.mbucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Making and giving public permission to the bucket
resource "aws_s3_bucket_public_access_block" "mbucket" {
  bucket = aws_s3_bucket.mbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "mbucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.mbucket,
    aws_s3_bucket_public_access_block.mbucket,
  ]

  bucket = aws_s3_bucket.mbucket.id
  acl    = "public-read"
}

# Static website hosting

# Index.html
resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.mbucket.id
    key    = "index.html"
    source = "index.html"
    acl = "public-read"
    content_type = "text/html"

    # The filemd5() function is available in Terraform 0.11.12 and later
    # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
    # etag = "${md5(file("path/to/file"))}"
    # etag = filemd5("path/to/file")
}

# Error.html
resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.mbucket.id
    key    = "error.html"
    source = "error.html"
    acl = "public-read"
    content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "website" {
    bucket = aws_s3_bucket.mbucket.id
    index_document {
    suffix = "index.html"
    }
    error_document {
    key = "error.html"
    }

    depends_on = [ aws_s3_bucket_acl.mbucket ]
}