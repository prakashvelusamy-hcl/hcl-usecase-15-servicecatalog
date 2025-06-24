output "servicecatalog_portfolio_id" {
  description = "The ID of the Service Catalog Portfolio"
  value       = module.servicecatalog.servicecatalog_portfolio_id
}

output "servicecatalog_product_id" {
  description = "The ID of the Service Catalog Product"
  value       = module.servicecatalog.servicecatalog_product_id
}

output "launch_role_arn" {
  description = "The ARN of the Launch Role associated with the product"
  value       = module.servicecatalog.launch_role_arn
}
