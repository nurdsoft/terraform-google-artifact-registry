variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "location" {
  description = "Repository location/region (e.g. us-central1)."
  type        = string
}

variable "repository_id" {
  description = "The ID of the repository."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]([a-z0-9-]*[a-z0-9])?$", var.repository_id)) && length(var.repository_id) <= 63
    error_message = "repository_id must be 1-63 characters, start and end with a lowercase letter or number, and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "format" {
  description = "Repository format. Supported values: DOCKER, NPM, MAVEN, PYTHON, APT, YUM, GOOGET, KFP, GO."
  type        = string

  validation {
    condition     = contains(["DOCKER", "NPM", "MAVEN", "PYTHON", "APT", "YUM", "GOOGET", "KFP", "GO"], var.format)
    error_message = "format must be one of: DOCKER, NPM, MAVEN, PYTHON, APT, YUM, GOOGET, KFP, GO."
  }
}

variable "description" {
  description = "Human-readable description of the repository."
  type        = string
  default     = ""
}

variable "labels" {
  description = "Labels to apply to the repository."
  type        = map(string)
  default     = {}
}

variable "kms_key_name" {
  description = "Cloud KMS key name for CMEK encryption. Set to null to disable."
  type        = string
  default     = null
}

variable "cleanup_policy_dry_run" {
  description = "Whether cleanup policies are applied in dry run mode. Set to null to omit cleanup policy configuration."
  type        = bool
  default     = null
}
