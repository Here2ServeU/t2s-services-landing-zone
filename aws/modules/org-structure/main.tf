resource "aws_organizations_organization" "org" {
  aws_service_access_principals = ["controltower.amazonaws.com"]
  feature_set                   = "ALL"
}

resource "aws_organizations_organizational_unit" "ou" {
  name      = var.ou_name
  parent_id = aws_organizations_organization.org.roots[0].id
}