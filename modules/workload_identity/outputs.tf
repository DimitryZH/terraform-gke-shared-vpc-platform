output "gsa_email" {
  value = google_service_account.gsa.email
}

output "gsa_name" {
  value = google_service_account.gsa.name
}

output "ksa_name" {
  value = kubernetes_service_account.ksa.metadata[0].name
}

output "namespace" {
  value = var.namespace
}
