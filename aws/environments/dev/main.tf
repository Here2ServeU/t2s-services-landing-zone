provider "aws" {
  region = var.region
}

module "backend" {
  source      = "../../modules/backend"
  bucket_name = var.bucket_name
  table_name  = var.table_name
}

module "org_structure" {
  source  = "../../modules/org-structure"
  ou_name = var.ou_name
}

module "policies" {
  source       = "../../modules/policies"
  guardrail_name = var.guardrail_name
  control_id     = var.control_id
  target_ou      = module.org_structure.ou_id
}