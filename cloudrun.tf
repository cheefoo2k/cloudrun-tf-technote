resource "google_cloud_run_service" "default" {
  name     = "wiz-cloudrun-svc"
  location = "us-central1"
  project = "nairahealth-1298"
  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"      = "1000"
        "run.googleapis.com/client-name"        = "terraform"
      }
    }
  }
  autogenerate_revision_name = true
}

