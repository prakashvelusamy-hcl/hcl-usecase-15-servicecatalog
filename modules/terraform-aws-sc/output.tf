output "servicecatalog_portfolio_id" {
  description = "The ID of the Service Catalog Portfolio"
  value       = aws_servicecatalog_portfolio.portfolio.id
}

output "servicecatalog_product_id" {
  description = "The ID of the Service Catalog Product"
  value       = aws_servicecatalog_product.product.id
}

output "launch_role_arn" {
  description = "The ARN of the Launch Role associated with the product"
  value       = aws_iam_role.sc_launch_role.arn
}
