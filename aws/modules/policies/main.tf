resource "aws_controltower_guardrail" "deny_internet" {
  name       = var.guardrail_name
  control_id = var.control_id
  target     = var.target_ou
}