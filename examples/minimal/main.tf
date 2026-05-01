module "artifact_registry" {
  source  = "nurdsoft/artifact-registry/google"
  version = "~> 0.1"

  project_id    = "my-gcp-project"
  location      = "us-central1"
  repository_id = "my-docker-repo"
  format        = "DOCKER"
  description   = "Docker image repository"
}
