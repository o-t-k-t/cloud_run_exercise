variable "project_id" { type = string }
variable "location" { type = string }

resource "google_artifact_registry_repository" "main" {
  repository_id = "cloud-run-exercise-main"
  description   = "main docker repository."
  format        = "DOCKER"
}

resource "google_cloud_run_service" "main" {
  depends_on = [google_artifact_registry_repository.main]

  name                       = "cloudrun"
  location                   = "us-central1"
  autogenerate_revision_name = true

  metadata {
    annotations = {
      # Max instances
      # https://cloud.google.com/run/docs/configuring/max-instances
      "autoscaling.knative.dev/maxScale" = 2
    }
  }

  template {
    spec {
      containers {
        # image = "gcr.io/cloud-run-exercise-main/testcontainer"
        image = "${var.location}-docker.pkg.dev/${var.project_id}/cloud-run-exercise-main/api-server:dev"
      }
    }
  }
}
