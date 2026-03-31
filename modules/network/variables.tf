variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_cidr" {
  description = "Primary subnet CIDR"
  type        = string
}

variable "pods_secondary_range_name" {
  description = "Secondary range name for Pods"
  type        = string
}

variable "pods_secondary_cidr" {
  description = "Secondary CIDR range for Pods"
  type        = string
}

variable "services_secondary_range_name" {
  description = "Secondary range name for Services"
  type        = string
}

variable "services_secondary_cidr" {
  description = "Secondary CIDR range for Services"
  type        = string
}
