resource "azurerm_management_group" "root" {
  display_name = var.root_name
}

resource "azurerm_management_group" "env" {
  display_name               = var.env_name
  parent_management_group_id = azurerm_management_group.root.id
}