terraform {
  required_version = ">= 1.5.7"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.8"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.7"
    }
  }
}

data "google_project" "project" {}

provider "google" {
  project = var.google_project
  region  = var.google_project_region
}


provider "kubernetes" {
  host                   = "https://${module.k8s.google_container_cluster.endpoint}"
  cluster_ca_certificate = base64decode(module.k8s.google_container_cluster.master_auth[0].cluster_ca_certificate)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = []
    command     = "gke-gcloud-auth-plugin"
  }
}

provider "helm" {
  kubernetes {
    host                   = module.k8s.google_container_cluster.endpoint
    cluster_ca_certificate = base64decode(module.k8s.google_container_cluster.master_auth[0].cluster_ca_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = []
      command     = "gke-gcloud-auth-plugin"
    }
  }
}
