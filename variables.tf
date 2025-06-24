variable "region" {
  default = "ap-south-1"
}

variable "bucket_name" {
  default = "prakash-cloudformation-template"
}

variable "user_arn" {
  description = "IAM User/Role ARN allowed to use the portfolio"
  type        = string
  default = "arn:aws:iam::495599733393:user/prakash-test"
}

variable "service_catalog_portfolio_name" {
    description = "The service catalog portfolio name"
    type = string
    default = "Prakash-My-hello-portfolio"
}

variable "service_catalog_product_name" {
    description = "The service catalog product name"
    type = string
    default = "Prakash-My-hello-product"
}