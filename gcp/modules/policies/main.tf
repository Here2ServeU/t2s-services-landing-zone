resource "google_org_policy_policy" "deny_external_ip" {
  name   = "organizations/${var.org_id}/policies/compute.vmExternalIpAccess"
  parent = "folders/${var.folder_id}"

  spec {
    rules {
      deny_all = true
    }
    inherit_from_parent = false
    reset = false
  }
}