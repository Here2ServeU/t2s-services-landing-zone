provider "azurerm" {
  features {}
}

module "backend" {
  source                = "../../modules/backend"
  prefix                = var.prefix
  location              = var.location
  storage_account_name  = var.storage_account_name
}

module "org_structure" {
  source     = "../../modules/org-structure"
  root_name  = var.root_name
  env_name   = var.env_name
}

module "policies" {
  source = "../../modules/policies"
  scope  = module.org_structure.env_group_id
}