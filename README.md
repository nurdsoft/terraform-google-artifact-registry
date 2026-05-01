# terraform-google-artifact-registry

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

A reusable Terraform module for managing GCP Artifact Registry repositories (`google_artifact_registry_repository`). Designed as a drop-in replacement for inline `google_artifact_registry_repository` resource blocks.

## Usage

```hcl
module "artifact_registry" {
  source  = "nurdsoft/artifact-registry/google"
  version = "~> 0.1"

  project_id    = "my-gcp-project"
  location      = "us-central1"
  repository_id = "my-docker-repo"
  format        = "DOCKER"
  description   = "Docker image repository"
}
```

## Inputs

| Name | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| `project_id` | `string` | yes | — | GCP project ID |
| `location` | `string` | yes | — | Repository location/region (e.g. `us-central1`) |
| `repository_id` | `string` | yes | — | The ID of the repository |
| `format` | `string` | yes | — | Repository format: `DOCKER`, `NPM`, `MAVEN`, `PYTHON`, `APT`, `YUM`, `GOOGET`, `KFP`, `GO` |
| `description` | `string` | no | `""` | Human-readable description of the repository |
| `labels` | `map(string)` | no | `{}` | Labels to apply to the repository |
| `kms_key_name` | `string` | no | `null` | Cloud KMS key name for CMEK encryption |
| `cleanup_policy_dry_run` | `bool` | no | `null` | Whether cleanup policies run in dry-run mode (`null` omits the field) |

## Outputs

| Name | Description |
|------|-------------|
| `repository_id` | The repository ID |
| `name` | Full resource name of the repository |
| `repository_url` | Docker-compatible pull URL (e.g. `us-central1-docker.pkg.dev/my-project/my-repo`) |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3 |
| hashicorp/google | >= 5.0 |

## License

MIT
