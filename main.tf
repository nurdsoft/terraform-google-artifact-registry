resource "google_artifact_registry_repository" "this" {
  project       = var.project_id
  location      = var.location
  repository_id = var.repository_id
  format        = var.format
  description   = var.description
  labels        = var.labels
  kms_key_name  = var.kms_key_name

  cleanup_policy_dry_run = var.cleanup_policy_dry_run
}
