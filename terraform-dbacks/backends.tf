terraform {
  backend "gcs" {
    bucket = "cs-tfstate-us-central1-9d634560bc30467396c52f621115bb99" #TBD
    prefix = "terraform/state"
  }
}
