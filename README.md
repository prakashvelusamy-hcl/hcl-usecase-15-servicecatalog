## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudformation"></a> [cloudformation](#module\_cloudformation) | ./modules/terraform-aws-s3-cloudformation | n/a |
| <a name="module_servicecatalog"></a> [servicecatalog](#module\_servicecatalog) | ./modules/terraform-aws-sc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | `"prakash-cloudformation-template"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"ap-south-1"` | no |
| <a name="input_service_catalog_portfolio_name"></a> [service\_catalog\_portfolio\_name](#input\_service\_catalog\_portfolio\_name) | The service catalog portfolio name | `string` | `"Prakash-My-hello-portfolio"` | no |
| <a name="input_service_catalog_product_name"></a> [service\_catalog\_product\_name](#input\_service\_catalog\_product\_name) | The service catalog product name | `string` | `"Prakash-My-hello-product"` | no |
| <a name="input_user_arn"></a> [user\_arn](#input\_user\_arn) | IAM User/Role ARN allowed to use the portfolio | `string` | `"arn:aws:iam::495599733393:user/prakash-test"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_launch_role_arn"></a> [launch\_role\_arn](#output\_launch\_role\_arn) | The ARN of the Launch Role associated with the product |
| <a name="output_servicecatalog_portfolio_id"></a> [servicecatalog\_portfolio\_id](#output\_servicecatalog\_portfolio\_id) | The ID of the Service Catalog Portfolio |
| <a name="output_servicecatalog_product_id"></a> [servicecatalog\_product\_id](#output\_servicecatalog\_product\_id) | The ID of the Service Catalog Product |
