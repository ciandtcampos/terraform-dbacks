module "cs-vpc-host-prod-mh006-dw504" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.5"

  name       = "vpc-host-prod"
  project_id = "vpc-host-prod-mh006-dw504"
  org_id     = var.org_id
  folder_id  = module.cs-common.id

  billing_account                = var.billing_account
  enable_shared_vpc_host_project = true
  depends_on = [
    module.cs-org-policy-iam_allowedPolicyMemberDomains,
    module.cs-org-policy-iam_automaticIamGrantsForDefaultServiceAccounts,
    module.cs-org-policy-compute_skipDefaultNetworkCreation,
  ]
}

module "cs-vpc-host-nonprod-mh006-dw504" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.5"

  name       = "vpc-host-nonprod"
  project_id = "vpc-host-nonprod-mh006-dw504"
  org_id     = var.org_id
  folder_id  = module.cs-common.id

  billing_account                = var.billing_account
  enable_shared_vpc_host_project = true
  depends_on = [
    module.cs-org-policy-iam_allowedPolicyMemberDomains,
    module.cs-org-policy-iam_automaticIamGrantsForDefaultServiceAccounts,
    module.cs-org-policy-compute_skipDefaultNetworkCreation,
  ]
}

module "cs-logging-mh006-dw504" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.5"

  name       = "logging"
  project_id = "logging-mh006-dw504"
  org_id     = var.org_id
  folder_id  = module.cs-common.id

  billing_account = var.billing_account
  depends_on = [
    module.cs-org-policy-iam_allowedPolicyMemberDomains,
    module.cs-org-policy-iam_automaticIamGrantsForDefaultServiceAccounts,
    module.cs-org-policy-compute_skipDefaultNetworkCreation,
  ]
}

module "cs-monitoring-prod-mh006-dw504" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.5"

  name       = "monitoring-prod"
  project_id = "monitoring-prod-mh006-dw504"
  org_id     = var.org_id
  folder_id  = module.cs-common.id

  billing_account = var.billing_account
  depends_on = [
    module.cs-org-policy-iam_allowedPolicyMemberDomains,
    module.cs-org-policy-iam_automaticIamGrantsForDefaultServiceAccounts,
    module.cs-org-policy-compute_skipDefaultNetworkCreation,
  ]
}

module "cs-monitoring-nonprod-mh006-dw504" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.5"

  name       = "monitoring-nonprod"
  project_id = "monitoring-nonprod-mh006-dw504"
  org_id     = var.org_id
  folder_id  = module.cs-common.id

  billing_account = var.billing_account
  depends_on = [
    module.cs-org-policy-iam_allowedPolicyMemberDomains,
    module.cs-org-policy-iam_automaticIamGrantsForDefaultServiceAccounts,
    module.cs-org-policy-compute_skipDefaultNetworkCreation,
  ]
}

module "cs-monitoring-dev-mh006-dw504" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.5"

  name       = "monitoring-dev"
  project_id = "monitoring-dev-mh006-dw504"
  org_id     = var.org_id
  folder_id  = module.cs-common.id

  billing_account = var.billing_account
  depends_on = [
    module.cs-org-policy-iam_allowedPolicyMemberDomains,
    module.cs-org-policy-iam_automaticIamGrantsForDefaultServiceAccounts,
    module.cs-org-policy-compute_skipDefaultNetworkCreation,
  ]
}
