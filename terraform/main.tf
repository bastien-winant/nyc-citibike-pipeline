resource "google_storage_bucket" "raw_data_bucket" {
  name          = "${var.gcs_bucket_name}-${var.project_id}"
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