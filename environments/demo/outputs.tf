output "cluster_name" {
  value = module.gke.cluster_name
}

output "cluster_endpoint" {
  value = module.gke.endpoint
}

output "network_name" {
  value = module.network.network_name
}

output "subnetwork_name" {
  value = module.network.subnetwork_name
}

output "workload_identity_gsa_email" {
  value = module.workload_identity.gsa_email
}