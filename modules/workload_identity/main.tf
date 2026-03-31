resource "google_service_account" "gsa" {
  project      = var.project_id
  account_id   = var.gsa_name
  display_name = var.gsa_display_name
}

resource "google_service_account_iam_member" "workload_identity_user" {
  service_account_id = google_service_account.gsa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${var.namespace}/${var.ksa_name}]"
}

resource "kubernetes_service_account" "ksa" {
  metadata {
    name      = var.ksa_name
    namespace = var.namespace
    annotations = {
      "iam.gke.io/gcp-service-account" = google_service_account.gsa.email
    }
  }
}
