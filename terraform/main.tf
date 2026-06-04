resource "google_storage_bucket" "landing_data_bucket" {
  name          = "${var.landing_bucket_name}-${var.project_id}"
  location      = var.location
  force_destroy = true
  storage_class = var.gcs_storage_class

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_storage_bucket" "archive_data_bucket" {
  name          = "${var.archive_bucket_name}-${var.project_id}"
  location      = var.location
  force_destroy = true
  storage_class = var.gcs_storage_class

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_storage_bucket" "error_data_bucket" {
  name          = "${var.error_bucket_name}-${var.project_id}"
  location      = var.location
  force_destroy = true
  storage_class = var.gcs_storage_class

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "dataset_raw" {
  dataset_id                 = var.bq_dataset_id_raw
  location                   = var.location
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dataset_stg" {
  dataset_id                 = var.bq_dataset_id_stg
  location                   = var.location
  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dataset_core" {
  dataset_id                 = var.bq_dataset_id_core
  location                   = var.location
  delete_contents_on_destroy = true
}