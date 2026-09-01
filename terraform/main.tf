resource "google_storage_bucket" "landing-bucket" {
  name          = "${var.project_id}_raw-trips"
  location      = var.region
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "raw_dataset" {
  dataset_id                 = "raw"
  description                = "Raw NYC Citibike trips data"
  location                   = var.region
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "stg_dataset" {
  dataset_id                 = "stg"
  description                = "Staging NYC Citibike trips data"
  location                   = var.region
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "core_dataset" {
  dataset_id                 = "core"
  description                = "Core NYC Citibike trips data"
  location                   = var.region
  delete_contents_on_destroy = true
}