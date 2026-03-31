variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
}

variable "kubernetes_version" {
  description = "Optional Kubernetes version"
  type        = string
  default     = null
}

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork_name" {
  description = "Subnet name"
  type        = string
}

variable "pods_secondary_range_name" {
  description = "Secondary range name for Pods"
  type        = string
}

variable "services_secondary_range_name" {
  description = "Secondary range name for Services"
  type        = string
}

variable "node_pool_name" {
  description = "Primary node pool name"
  type        = string
}

variable "node_machine_type" {
  description = "Machine type for primary node pool"
  type        = string
}

variable "node_disk_size_gb" {
  description = "Disk size for nodes"
  type        = number
  default     = 30
}

variable "node_count_min" {
  description = "Minimum autoscaling node count"
  type        = number
  default     = 1
}

variable "node_count_max" {
  description = "Maximum autoscaling node count"
  type        = number
  default     = 2
}

variable "enable_spot_pool" {
  description = "Whether to create a spot node pool"
  type        = bool
  default     = false
}

variable "spot_pool_name" {
  description = "Spot node pool name"
  type        = string
  default     = "spot-pool"
}

variable "spot_machine_type" {
  description = "Machine type for spot node pool"
  type        = string
  default     = "e2-medium"
}

variable "labels" {
  description = "Cluster labels"
  type        = map(string)
  default     = {}
}
