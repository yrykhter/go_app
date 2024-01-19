variable "cluster_service_account" {
  type        = string
  description = "Service account for creating cluster"
  default     = "cluster-sa"
}
variable "cluster_name" {
  type        = string
  description = "Name for the cluster"
  default     = "gke-cluster"
}
variable "node_name" {
  type        = string
  description = "Name for the node pool"
  default     = "node-pool"
}
variable "google_project" {
  type        = string
  description = "Google project for resources"
}
variable "google_project_region" {
  type        = string
  description = "Project region for the cluster and node pool"
  default     = "us-central1-a"
}
variable "node_count" {
  type        = number
  description = "The number of nodes"
  default     = 1
}
variable "preemptible_nodes" {
  type        = bool
  description = "Use preemptible nodes or not"
  default     = false
}
variable "machine_type" {
  type        = string
  description = "Machine type for the node"
  default     = "e2-standard-4"
}
