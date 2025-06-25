# IAM Role for Service Catalog to assume
resource "aws_iam_role" "sc_launch_role" {
  name = "ServiceCatalogLaunchRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "servicecatalog.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "sc_launch_policy" {
  name = "ServiceCatalogLaunchPolicy"
  role = aws_iam_role.sc_launch_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:*Vpc",
          "ec2:*Subnet",
          "ec2:*InternetGateway",
          "ec2:*RouteTable",
          "ec2:CreateRoute",
          "ec2:DeleteRoute",
          "ec2:AssociateRouteTable",
          "ec2:*SecurityGroup",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:RunInstances",
          "ec2:TerminateInstances",
          "ec2:AllocateAddress",
          "ec2:AssociateAddress",
          "ec2:DisassociateAddress",
          "ec2:ReleaseAddress",
          "ec2:CreateTags",
          "ec2:DeleteTags",
          "ec2:ModifyVpcAttribute",
          "ec2:Describe*"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "cloudformation:CreateStack",
          "cloudformation:DeleteStack",
          "cloudformation:DescribeStacks",
          "cloudformation:DescribeStackEvents",
          "cloudformation:GetTemplateSummary",
          "cloudformation:ValidateTemplate"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:ListBucket"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = "iam:PassRole",
        Resource = aws_iam_role.sc_launch_role.arn
      }
    ]
  })
}




# # IAM Policy for the role (you can customize this further)
# resource "aws_iam_role_policy" "sc_launch_policy" {
#   name = "ServiceCatalogLaunchPolicy"
#   role = aws_iam_role.sc_launch_role.id

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Action = "*",
#         Resource = "*"
#       }
#     ]
#   })
# }