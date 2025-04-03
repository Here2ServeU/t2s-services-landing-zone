resource "google_folder" "env" {
  display_name = var.folder_name
  parent       = var.parent_id
}