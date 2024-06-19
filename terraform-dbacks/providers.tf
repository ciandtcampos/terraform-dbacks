# Default provider configuration
provider "google" {
  project = var.project_id
  region  = var.region
}

# Aliased provider for Org Policy API
provider "google" {
  alias                 = "org_policy"
  user_project_override = true
  billing_project       = var.billing_project
}

# Aliased provider for Cloud Identity API
provider "google-beta" {
  alias                 = "identity"
  user_project_override = true
  billing_project       = var.billing_project
}
