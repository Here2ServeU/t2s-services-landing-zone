terraform {
  backend "gcs" {
    bucket = "t2s-gcp-dev-tfstate"
    prefix = "dev/terraform.tfstate"
  }
}