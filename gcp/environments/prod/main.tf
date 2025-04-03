provider "google" {
  project = var.project_id
  region  = var.region
}

module "backend" {
  source      = "../../modules/backend"
  bucket_name = var.bucket_name
  location    = var.location
}

module "org_structure" {
  source      = "../../modules/org-structure"
  folder_name = var.folder_name
  parent_id   = var.parent_id
}

module "policies" {
  source        = "../../modules/policies"
  org_id        = var.org_id
  folder_id     = module.org_structure.folder_id
}