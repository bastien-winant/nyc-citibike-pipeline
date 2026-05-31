variable "project_id" {
  type        = string
  description = "GCP project ID"
  default     = "nyc-citibike-pipeline-bw2026"
}

variable "credentials" {
  description = "Path to the service account credentials file"
  default     = "./keys/gcp-creds.json"
}

variable "location" {
  type        = string
  description = "Region where GCP resources will be deployed"
  default     = "europe-west1"
}

variable "landing_bucket_name" {
  type        = string
  description = "Name of the GCS bucket that contains the raw Citibike trip data"
  default     = "citibike-trips"
}

variable "archive_bucket_name" {
  type        = string
  description = "Name of the GCS bucket that contains the raw Citibike trip data"
  default     = "citibike-trips-archive"
}

variable "gcs_storage_class" {
  type        = string
  description = "Storage class for the GCS bucket that contains the raw Citibike trip data"
  default     = "STANDARD"
}

variable "bq_dataset_id_raw" {
  type        = string
  description = "ID of the BigQuery Dataset that contains the raw Citibike trip data"
  default     = "raw"
}

variable "bq_dataset_id_stg" {
  type        = string
  description = "ID of the BigQuery Dataset that contains the staging data"
  default     = "stg"
}

variable "bq_dataset_id_core" {
  type        = string
  description = "ID of the BigQuery Dataset that contains the core data"
  default     = "core"
}