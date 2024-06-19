resource "google_project_service" "composer_api" {
  for_each = toset([
    "composer.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudtasks.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "file.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com"
  ])
  project = var.project_id
  service = each.key
}

resource "google_compute_network" "composer_vpc" {
  name       = "dbacks-composer-vpc"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.composer_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.128.0.0/9"]
}

resource "google_storage_bucket" "composer_bucket" {
  name     = "dbacks-composer-bucket"
  location = "US"
}

resource "google_project_iam_binding" "composer_service_agent" {
  project = var.project_id
  role    = "roles/composer.ServiceAgentV2Ext"

  members = [
    "serviceAccount:service-807380706310@cloudcomposer-accounts.iam.gserviceaccount.com"
  ]
}

resource "google_composer_environment" "composer_environment" {
  name    = "dbacks-composer-environment"
  region  = "us-central1"

  config {
    node_count = 3
    software_config {
      image_version = "composer-2.8.2-airflow-2.7.3"
      env_variables = {
        key1 = "value1"
        key2 = "value2"
      }
      airflow_config_overrides = {
        "core-dag_concurrency" = "8"
      }
    }
    node_config {
      network = google_compute_network.composer_vpc.id
    }
  }
}

resource "null_resource" "upload_dags" {
  provisioner "local-exec" {
    command = "gsutil cp path/to/your/dag.py gs://${google_storage_bucket.composer_bucket.name}/dags"
  }
}
