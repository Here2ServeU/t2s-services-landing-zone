resource "azurerm_policy_definition" "deny_public_ip" {
  name         = "deny-public-ip"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny Public IP"
  description  = "Deny use of public IP addresses"

  policy_rule = <<POLICY
{
  "if": {
    "field": "Microsoft.Network/publicIPAddresses/ipAddress",
    "exists": "true"
  },
  "then": {
    "effect": "deny"
  }
}
POLICY
}

resource "azurerm_policy_assignment" "deny_public_ip_assignment" {
  name                 = "deny-public-ip-assignment"
  scope                = var.scope
  policy_definition_id = azurerm_policy_definition.deny_public_ip.id
}