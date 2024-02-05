module "k8s" {
  cluster_name          = var.cluster_name
  source                = "./modules/k8s"
  google_project_region = var.google_project_region
  google_project        = var.google_project
}

module "prometheus" {
  depends_on = [module.k8s]
  source     = "./modules/prometheus"
}
module "traefik" {
  depends_on = [module.k8s]
  source     = "./modules/traefik"
}

module "grafana" {
  depends_on = [module.k8s]
  source     = "./modules/grafana"
}

# module "jaeger-operator" {
#   depends_on = [module.k8s, module.cert-manager]
#   source     = "./modules/jaeger"
# }
# module "cert-manager" {
#   depends_on = [module.k8s]
#   source     = "./modules/cert-manager"
# }
