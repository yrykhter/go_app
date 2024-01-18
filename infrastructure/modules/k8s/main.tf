resource "google_service_account" "cluster_sa" {
  account_id   = var.cluster_service_account
  display_name = "Service account for creating cluster"
  project      = var.google_project
}

resource "google_container_cluster" "primary_cluster" {
  name     = var.cluster_name
  project  = var.google_project
  location = var.google_project_region

  deletion_protection = false
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.node_name
  project    = var.google_project
  location   = var.google_project_region
  cluster    = google_container_cluster.primary_cluster.name
  node_count = var.node_count

  node_config {
    preemptible  = var.preemptible_nodes
    machine_type = var.machine_type

    service_account = google_service_account.cluster_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
