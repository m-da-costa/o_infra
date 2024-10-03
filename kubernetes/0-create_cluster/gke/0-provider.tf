# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
# https://www.terraform.io/language/settings/backends/gcs
terraform {
  # backend "gcs" {
  #   bucket = "terraform_kubernetes"
  #   prefix = "terraform/state"
  # }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
