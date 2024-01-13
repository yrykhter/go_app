variable "cluster_name" {
  type        = string
  description = "Name for the cluster"
  default     = "gke-cluster"
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
