module "k8s" {
  cluster_name          = var.cluster_name
  source                = "./modules/k8s"
  google_project_region = var.google_project_region
  google_project        = var.google_project
}

module "kube-prometheus" {
  depends_on = [ module.k8s ]
  source = "./modules/kube-prometheus"
  kube-version = "36.2.0"
}

module "jaeger-operator" {
  depends_on = [ module.k8s ]
  source = "./modules/jaeger"
}

# module "traefik"{
#   source = "./modules/traefik"
# }
