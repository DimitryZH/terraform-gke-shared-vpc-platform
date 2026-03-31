output "network_name" {
  value = google_compute_network.vpc.name
}

output "subnetwork_name" {
  value = google_compute_subnetwork.subnet.name
}

output "pods_secondary_range_name" {
  value = var.pods_secondary_range_name
}

output "services_secondary_range_name" {
  value = var.services_secondary_range_name
}
