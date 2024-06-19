# Create BigQuery datasets
resource "google_bigquery_dataset" "bronze" {
  dataset_id = "stats_api_bulk_delivery_public"
  project    = var.project_id
  location   = "US"
}

resource "google_bigquery_dataset" "silver" {
  dataset_id = "dbacks_silver"
  project    = var.project_id
  location   = "US"
}

resource "google_bigquery_dataset" "gold" {
  dataset_id = "dbacks_gold"
  project    = var.project_id
  location   = "US"
}

# Automate the deployment of Dataform pipelines
resource "null_resource" "dataform_deploy" {
  provisioner "local-exec" {
    command = "bash ${path.module}/deploy_dataform.sh"
  }
}
