terraform {
  backend "azurerm" {
    resource_group_name  = "t2s-azure-dev-tfstate-rg"
    storage_account_name = "t2sazuredevsa"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}