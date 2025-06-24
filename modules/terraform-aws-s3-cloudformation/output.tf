output "product_template_url" {
  value = "https://${aws_s3_bucket.sc_template_bucket.bucket}.s3.amazonaws.com/${aws_s3_object.product_template.key}"
}
