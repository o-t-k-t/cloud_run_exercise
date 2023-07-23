variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

terraform {
  required_version = "~> 1.5.3"
}

module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.2"

  project_id = var.project_id

  activate_apis = [
    "artifactregistry.googleapis.com",
    "run.googleapis.com",
  ]
}

module "cloud_run" {
  depends_on = [module.project-services]

  source     = "../../modules/cloud_run"
  project_id = var.project_id
  location   = var.region
}
