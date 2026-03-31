module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "~> 36.0"

  project_id = var.project_id
  name       = var.cluster_name
  region     = var.region

  network    = var.network_name
  subnetwork = var.subnetwork_name

  ip_range_pods     = var.pods_secondary_range_name
  ip_range_services = var.services_secondary_range_name

  release_channel    = "STABLE"
  kubernetes_version = var.kubernetes_version

  deletion_protection = false

  enable_private_nodes    = true
  enable_private_endpoint = false
  master_ipv4_cidr_block  = "172.16.0.0/28"

  enable_vertical_pod_autoscaling = false
  horizontal_pod_autoscaling      = true

  remove_default_node_pool = true
  create_service_account   = true
  grant_registry_access    = true

  datapath_provider = "ADVANCED_DATAPATH"

  node_pools = concat(
    [
      {
        name               = var.node_pool_name
        machine_type       = var.node_machine_type
        node_locations     = ""
        min_count          = var.node_count_min
        max_count          = var.node_count_max
        local_ssd_count    = 0
        spot               = false
        disk_size_gb       = var.node_disk_size_gb
        disk_type          = "pd-standard"
        image_type         = "COS_CONTAINERD"
        enable_gcfs        = false
        enable_gvnic       = false
        auto_repair        = true
        auto_upgrade       = true
        preemptible        = false
        initial_node_count = var.node_count_min
      }
    ],
    var.enable_spot_pool ? [
      {
        name               = var.spot_pool_name
        machine_type       = var.spot_machine_type
        node_locations     = ""
        min_count          = 0
        max_count          = 1
        local_ssd_count    = 0
        spot               = true
        disk_size_gb       = var.node_disk_size_gb
        disk_type          = "pd-standard"
        image_type         = "COS_CONTAINERD"
        enable_gcfs        = false
        enable_gvnic       = false
        auto_repair        = true
        auto_upgrade       = true
        preemptible        = false
        initial_node_count = 1
      }
    ] : []
  )

  node_pools_oauth_scopes = concat(
    [
      {
        name = var.node_pool_name
        scopes = [
          "https://www.googleapis.com/auth/cloud-platform"
        ]
      }
    ],
    var.enable_spot_pool ? [
      {
        name = var.spot_pool_name
        scopes = [
          "https://www.googleapis.com/auth/cloud-platform"
        ]
      }
    ] : []
  )

  node_pools_labels = concat(
    [
      {
        name   = var.node_pool_name
        labels = merge(var.labels, { workload = "general" })
      }
    ],
    var.enable_spot_pool ? [
      {
        name   = var.spot_pool_name
        labels = merge(var.labels, { workload = "spot" })
      }
    ] : []
  )

  node_pools_metadata = concat(
    [
      {
        name = var.node_pool_name
        metadata = {
          disable-legacy-endpoints = "true"
        }
      }
    ],
    var.enable_spot_pool ? [
      {
        name = var.spot_pool_name
        metadata = {
          disable-legacy-endpoints = "true"
        }
      }
    ] : []
  )

  node_pools_tags = concat(
    [
      {
        name = var.node_pool_name
        tags = ["gke", "general"]
      }
    ],
    var.enable_spot_pool ? [
      {
        name = var.spot_pool_name
        tags = ["gke", "spot"]
      }
    ] : []
  )
}
