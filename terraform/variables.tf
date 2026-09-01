variable "project_id" {
  description = "GCP Project ID"
  default     = "nyc-citibike-pipeline-bw2026"
}

variable "region" {
  description = "Default GCP region"
  default     = "europe-west1"
}

variable "credentials" {
  description = "Service account credentials file path"
  default     = "../keys/terraform-sa-key.json"
}