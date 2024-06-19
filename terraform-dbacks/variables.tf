variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
  default     = "0170CB-789085-1D44DD" #MLB BILLING ACCOUNT
}

variable "org_id" {
  description = "The organization id for the associated resources"
  type        = string
  default     = "60201057015" #DBACKS OrgID
}

variable "billing_project" {
  description = "The project id to use for billing"
  type        = string
  default     = "dbacks-setup-host-project" #Cloud Setup Host Project
}

variable "project_id" {
  description = "The project ID where resources will be created"
  type        = string
}

variable "region" {
  description = "Region for GCP resources"
  type        = string
  default     = "us-central1"
}