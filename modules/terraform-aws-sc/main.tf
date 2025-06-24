# Create a Service Catalog Portfolio
resource "aws_servicecatalog_portfolio" "portfolio" {
  name          = var.service_catalog_portfolio_name
  description   = "A test portfolio"
  provider_name = "MyProvider"
}

# Create a Service Catalog Product
resource "aws_servicecatalog_product" "product" {
  name          = var.service_catalog_product_name
  owner         = "MyCompany"
  type          = "CLOUD_FORMATION_TEMPLATE"
  description   = "Product created from CloudFormation"

  provisioning_artifact_parameters {
    name           = "v1"
    description    = "Initial version"
    type           = "CLOUD_FORMATION_TEMPLATE"
    template_url   = var.product_template_url
  }
}

# Associate Product with Portfolio
resource "aws_servicecatalog_product_portfolio_association" "portfolio_product" {
  portfolio_id = aws_servicecatalog_portfolio.portfolio.id
  product_id   = aws_servicecatalog_product.product.id
}

# Allow user (or group/role) to access the portfolio
resource "aws_servicecatalog_principal_portfolio_association" "portfolio_principal" {
  portfolio_id = aws_servicecatalog_portfolio.portfolio.id
  principal_arn = var.user_arn
  principal_type = "IAM"
}

# Associate the launch role with the product
resource "aws_servicecatalog_constraint" "launch_role_constraint" {
  portfolio_id = aws_servicecatalog_portfolio.portfolio.id
  product_id   = aws_servicecatalog_product.product.id
  type         = "LAUNCH"

  parameters = jsonencode({
    RoleArn = aws_iam_role.sc_launch_role.arn
  })
  depends_on = [aws_iam_role.sc_launch_role]
}