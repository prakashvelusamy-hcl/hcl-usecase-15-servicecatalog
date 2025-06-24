variable "product_template_url" {
    description = "The the product template"
    type =  string
}
variable "user_arn" {
  description = "IAM User/Role ARN allowed to use the portfolio"
  type        = string
}

variable "service_catalog_portfolio_name" {
    description = "The service catalog portfolio name"
    type = string
}

variable "service_catalog_product_name" {
    description = "The service catalog product name"
    type = string
}

variable "bucket_name" {
  description = "The s3 bucket name"
  type = string
}