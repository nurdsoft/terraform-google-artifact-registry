output "repository_id" {
  description = "The repository ID."
  value       = google_artifact_registry_repository.this.repository_id
}

output "name" {
  description = "Full resource name of the repository."
  value       = google_artifact_registry_repository.this.name
}

output "repository_url" {
  description = "Pull URL for the repository (e.g. us-central1-docker.pkg.dev/my-project/my-repo)."
  value       = "${var.location}-${lower(var.format)}.pkg.dev/${var.project_id}/${var.repository_id}"
}
