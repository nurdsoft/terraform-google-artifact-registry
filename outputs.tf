output "repository_id" {
  description = "The repository ID."
  value       = google_artifact_registry_repository.this.repository_id
}

output "name" {
  description = "Full resource name of the repository."
  value       = google_artifact_registry_repository.this.name
}

output "repository_url" {
  description = "Docker-compatible pull URL for the repository."
  value       = "${var.location}-docker.pkg.dev/${var.project_id}/${var.repository_id}"
}
