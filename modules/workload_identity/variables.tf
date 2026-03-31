variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for the KSA"
  type        = string
}

variable "gsa_name" {
  description = "Google service account name"
  type        = string
}

variable "gsa_display_name" {
  description = "Google service account display name"
  type        = string
  default     = "Workload Identity Service Account"
}

variable "ksa_name" {
  description = "Kubernetes service account name"
  type        = string
}