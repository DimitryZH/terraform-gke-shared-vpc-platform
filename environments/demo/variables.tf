variable "project_id" {
  description = "GCP project ID for the demo environment"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Primary GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "demo"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "gke-demo-vpc"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "gke-demo-subnet"
}

variable "subnet_cidr" {
  description = "Primary subnet CIDR"
  type        = string
  default     = "10.10.0.0/20"
}

variable "pods_secondary_range_name" {
  description = "Secondary range name for pods"
  type        = string
  default     = "pods-range"
}

variable "pods_secondary_cidr" {
  description = "Secondary CIDR for pods"
  type        = string
  default     = "10.20.0.0/16"
}

variable "services_secondary_range_name" {
  description = "Secondary range name for services"
  type        = string
  default     = "services-range"
}

variable "services_secondary_cidr" {
  description = "Secondary CIDR for services"
  type        = string
  default     = "10.30.0.0/20"
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "gke-demo-cluster"
}

variable "kubernetes_version" {
  description = "Optional GKE version. Leave null for default/stable channel."
  type        = string
  default     = null
}

variable "node_pool_name" {
  description = "Primary node pool name"
  type        = string
  default     = "general-pool"
}

variable "node_machine_type" {
  description = "Machine type for general node pool"
  type        = string
  default     = "e2-medium"
}

variable "node_disk_size_gb" {
  description = "Disk size for cluster nodes"
  type        = number
  default     = 30
}

variable "node_count_min" {
  description = "Minimum number of nodes in autoscaling pool"
  type        = number
  default     = 1
}

variable "node_count_max" {
  description = "Maximum number of nodes in autoscaling pool"
  type        = number
  default     = 2
}

variable "enable_spot_pool" {
  description = "Whether to create a spot/preemptible demo node pool"
  type        = bool
  default     = false
}

variable "spot_pool_name" {
  description = "Spot node pool name"
  type        = string
  default     = "spot-pool"
}

variable "spot_machine_type" {
  description = "Machine type for spot pool"
  type        = string
  default     = "e2-medium"
}

variable "microservices_namespace" {
  description = "Namespace for demo microservices"
  type        = string
  default     = "microservices"
}

variable "legacy_namespace" {
  description = "Namespace for legacy workloads"
  type        = string
  default     = "legacy"
}

variable "gsa_name" {
  description = "Google service account name for workload identity demo"
  type        = string
  default     = "demo-workload-sa"
}

variable "ksa_name" {
  description = "Kubernetes service account name for workload identity demo"
  type        = string
  default     = "demo-ksa"
}
