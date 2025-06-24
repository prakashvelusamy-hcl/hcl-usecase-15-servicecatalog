resource "aws_s3_bucket_policy" "sc_bucket_policy" {
  bucket = aws_s3_bucket.sc_template_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "AllowCloudFormationReadAccess",
        Effect = "Allow",
        Principal = {
          Service = "cloudformation.amazonaws.com"
        },
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion"
        ],
        Resource = "arn:aws:s3:::${aws_s3_bucket.sc_template_bucket.bucket}/*"
      }
    ]
  })
}
