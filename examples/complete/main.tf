module "artifact_registry" {
  source = "git::https://github.com/nurdsoft/terraform-google-artifact-registry.git?ref=v0.1.0"

  project_id    = "my-gcp-project"
  location      = "us-central1"
  repository_id = "my-docker-repo"
  format        = "DOCKER"
  description   = "Docker image repository"

  labels = {
    env  = "production"
    team = "platform"
  }

  # false = cleanup policies are actively enforced (deletions will occur)
  cleanup_policy_dry_run = false
}
