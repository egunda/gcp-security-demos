# Enable services
resource "google_project_service" "compute" {
  project = var.project
  service = "compute.googleapis.com"
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

resource "google_project_service" "kms" {
  project = var.project
  service = "cloudkms.googleapis.com"
}

resource "google_project_service" "functions" {
  project = var.project
  service = "cloudfunctions.googleapis.com"
}

resource "google_project_service" "cloud_build" {
  project = var.project
  service = "cloudbuild.googleapis.com"
}

resource "google_project_service" "artifact_registry" {
  project = var.project
  service = "artifactregistry.googleapis.com"
}
