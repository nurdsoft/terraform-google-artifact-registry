# terraform-google-artifact-registry

## Overview

This Terraform module provisions a GCP Artifact Registry repository using `google_artifact_registry_repository`. It standardises repository creation across projects so that the resource does not need to be defined as an inline raw resource in each project's deploy configuration.

## Usage

`Basic (DOCKER)`:

```hcl
module "artifact_registry" {
  source = "git::https://github.com/nurdsoft/terraform-google-artifact-registry.git?ref=v0.1.0"

  project_id    = "my-gcp-project"
  location      = "us-central1"
  repository_id = "my-docker-repo"
  format        = "DOCKER"
  description   = "Docker image repository"
}
```

`With CMEK encryption`:

```hcl
module "artifact_registry" {
  source = "git::https://github.com/nurdsoft/terraform-google-artifact-registry.git?ref=v0.1.0"

  project_id    = "my-gcp-project"
  location      = "us-central1"
  repository_id = "my-docker-repo"
  format        = "DOCKER"
  kms_key_name  = "projects/my-gcp-project/locations/us-central1/keyRings/my-ring/cryptoKeys/my-key"
}
```

`With labels`:

```hcl
module "artifact_registry" {
  source = "git::https://github.com/nurdsoft/terraform-google-artifact-registry.git?ref=v0.1.0"

  project_id    = "my-gcp-project"
  location      = "us-central1"
  repository_id = "my-docker-repo"
  format        = "DOCKER"

  labels = {
    env  = "production"
    team = "platform"
  }
}
```

## Assumptions

- A basic understanding of [Git](https://git-scm.com/). Git version `>= 2.33.0`.
- An existing GCP IAM user or role with permission to create/update/delete `google_artifact_registry_repository` resources.
- [GCloud CLI](https://cloud.google.com/sdk/docs/install) `>= 465.0.0`
- A basic understanding of [Terraform](https://www.terraform.io/). Terraform version `>= 1.3`.

## Test

```sh
gcloud init
gcloud auth application-default login
cd examples/minimal
terraform init
terraform plan
terraform apply
terraform destroy
```

## Contributions

Contributions are always welcome. As such, this project uses the `main` branch as the source of truth to track changes.

**Step 1**. Clone this project.

```sh
# Using Git
$ git clone git@github.com:nurdsoft/terraform-google-artifact-registry.git

# Using HTTPS
$ git clone https://github.com/nurdsoft/terraform-google-artifact-registry.git
```

**Step 2**. Checkout a feature branch: `git checkout -b feat/abc`.

**Step 3**. Validate the change/s locally by executing the steps defined under [Test](#test).

**Step 4**. If testing is successful, commit and push the new change/s to the remote.

```sh
$ git add file1 file2 ...

$ git commit -m "Adding some change"

$ git push --set-upstream origin feat/abc
```

**Step 5**. Once pushed, create a [PR](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) and assign it to a member for review.

- **Important Note**: It can be helpful to attach the `terraform plan` output in the PR.

**Step 6**. A team member reviews/approves/merges the change/s.

**Step 7**. Once merged, deploy the required changes as needed.

**Step 8**. Once deployed, verify that the changes have been deployed.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3 |
| google | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 6.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | GCP project ID | `string` | n/a | yes |
| location | Repository location/region (e.g. `us-central1`) | `string` | n/a | yes |
| repository\_id | The ID of the repository | `string` | n/a | yes |
| format | Repository format: `DOCKER`, `NPM`, `MAVEN`, `PYTHON`, `APT`, `YUM`, `GOOGET`, `KFP`, `GO` | `string` | n/a | yes |
| description | Human-readable description of the repository | `string` | `""` | no |
| labels | Labels to apply to the repository | `map(string)` | `{}` | no |
| kms\_key\_name | Cloud KMS key name for CMEK encryption | `string` | `null` | no |
| cleanup\_policy\_dry\_run | Whether cleanup policies run in dry-run mode (`null` omits the field) | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| repository\_id | The repository ID |
| name | Full resource name of the repository |
| repository\_url | Docker-compatible pull URL (e.g. `us-central1-docker.pkg.dev/my-project/my-repo`) |

## Authors

Module is maintained by [Nurdsoft](https://github.com/nurdsoft).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/nurdsoft/terraform-google-artifact-registry/blob/main/LICENSE) for full details.
