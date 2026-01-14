# Enable services
resource "google_project_service" "compute" {
  project = var.project
  service = "compute.googleapis.com"
}

resource "google_project_service" "functions" {
  project = var.project
  service = "cloudfunctions.googleapis.com"
}

resource "google_project_service" "kms" {
  project = var.project
  service = "cloudkms.googleapis.com"
}

resource "google_project_service" "managed_kubernetes" {
  project = var.project
  service = "container.googleapis.com"
}

resource "google_project_service" "binauthz" {
  project = var.project
  service = "binaryauthorization.googleapis.com"
}

resource "google_project_service" "artifact_registry" {
  project = var.project
  service = "artifactregistry.googleapis.com"
}

resource "google_project_service" "cloud_build" {
  project = var.project
  service = "cloudbuild.googleapis.com"
}

resource "google_project_service" "cloud_deploy" {
  project = var.project
  service = "clouddeploy.googleapis.com"
}

resource "google_project_service" "ondemand_scanning" {
  project = var.project
  service = "ondemandscanning.googleapis.com"
}

resource "google_project_service" "container_scanning" {
  project = var.project
  service = "containerscanning.googleapis.com"
}

resource "google_project_service" "data_loss_prevention" {
  project = var.project
  service = "dlp.googleapis.com"
}

resource "google_project_service" "cloud_sql" {
  project = var.project
  service = "sqladmin.googleapis.com"
}

resource "google_project_service" "iap" {
  project = var.project
  service = "iap.googleapis.com"
}

resource "google_project_service" "cloud_ids" {
  project = var.project
  service = "ids.googleapis.com"
}

resource "google_project_service" "service_networking" {
  project = var.project
  service = "servicenetworking.googleapis.com"
}

resource "google_project_service" "network_security" {
  project = var.project
  service = "networksecurity.googleapis.com"
}

resource "google_project_service" "iam" {
  project = var.project
  service = "iam.googleapis.com"
}

resource "google_project_service" "resourcemanager" {
  project = var.project
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "securitycenter" {
  project = var.project
  service = "securitycenter.googleapis.com"
}

resource "google_project_service" "cloudasset" {
  project = var.project
  service = "cloudasset.googleapis.com"
}

resource "google_project_service" "admin" {
  project = var.project
  service = "admin.googleapis.com"
}

resource "google_project_service" "recaptcha" {
  project = var.project
  service = "recaptchaenterprise.googleapis.com"
}

resource "google_project_service" "run" {
  project = var.project
  service = "run.googleapis.com"
}

resource "google_project_service" "logging" {
  project = var.project
  service = "logging.googleapis.com"
}

resource "google_project_service" "monitoring" {
  project = var.project
  service = "monitoring.googleapis.com"
}

resource "google_project_service" "bigquery" {
  project = var.project
  service = "bigquery.googleapis.com"
}

resource "google_project_service" "secret_manager" {
  project = var.project
  service = "secretmanager.googleapis.com"
}

resource "google_project_service" "storage" {
  project = var.project
  service = "storage.googleapis.com"
}

resource "google_project_service" "model_armor" {
  project = var.project
  service = "modelarmor.googleapis.com"
}