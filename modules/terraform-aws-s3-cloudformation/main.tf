# S3 Bucket to store CloudFormation template
resource "aws_s3_bucket" "sc_template_bucket" {
  bucket = var.bucket_name
  force_destroy = true
}

# Upload CloudFormation template to S3
resource "aws_s3_object" "product_template" {
  bucket = aws_s3_bucket.sc_template_bucket.id
  key    = "product-template.yaml"
  source = "${path.module}/product-template.yaml"
  etag   = filemd5("${path.module}/product-template.yaml")
  content_type = "text/yaml"
}