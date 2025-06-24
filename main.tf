module "cloudformation" {
    source = "./modules/terraform-aws-s3-cloudformation"
    bucket_name = var.bucket_name
}

module "servicecatalog" {
    source = "./modules/terraform-aws-sc"
    product_template_url = module.cloudformation.product_template_url
    user_arn = var.user_arn
    service_catalog_portfolio_name = var.service_catalog_portfolio_name
    service_catalog_product_name  = var.service_catalog_product_name
    bucket_name = var.bucket_name
}