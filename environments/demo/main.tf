data "google_client_config" "default" {}

locals {
  common_labels = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "gke-platform-demo"
  }
}

module "project_services" {
  source = "../../modules/project_services"

  project_id = var.project_id

  services = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com"
  ]
}

module "network" {
  source = "../../modules/network"

  project_id                    = var.project_id
  region                        = var.region
  vpc_name                      = var.vpc_name
  subnet_name                   = var.subnet_name
  subnet_cidr                   = var.subnet_cidr
  pods_secondary_range_name     = var.pods_secondary_range_name
  pods_secondary_cidr           = var.pods_secondary_cidr
  services_secondary_range_name = var.services_secondary_range_name
  services_secondary_cidr       = var.services_secondary_cidr
}

module "gke" {
  source = "../../modules/gke"

  depends_on = [
    module.project_services,
    module.network
  ]

  project_id                    = var.project_id
  region                        = var.region
  cluster_name                  = var.cluster_name
  kubernetes_version            = var.kubernetes_version
  network_name                  = module.network.network_name
  subnetwork_name               = module.network.subnetwork_name
  pods_secondary_range_name     = module.network.pods_secondary_range_name
  services_secondary_range_name = module.network.services_secondary_range_name

  node_pool_name    = var.node_pool_name
  node_machine_type = var.node_machine_type
  node_disk_size_gb = var.node_disk_size_gb
  node_count_min    = var.node_count_min
  node_count_max    = var.node_count_max

  enable_spot_pool  = var.enable_spot_pool
  spot_pool_name    = var.spot_pool_name
  spot_machine_type = var.spot_machine_type

  labels = local.common_labels
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "namespaces" {
  source = "../../modules/namespaces"

  depends_on = [module.gke]

  namespaces = [
    var.microservices_namespace,
    var.legacy_namespace
  ]
}

module "workload_identity" {
  source = "../../modules/workload_identity"

  depends_on = [
    module.gke,
    module.namespaces
  ]

  project_id       = var.project_id
  namespace        = var.microservices_namespace
  gsa_name         = var.gsa_name
  gsa_display_name = "Demo Workload Identity Service Account"
  ksa_name         = var.ksa_name
}