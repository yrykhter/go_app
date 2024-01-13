module "infrastructure" {
  cluster_name          = var.cluster_name
  source                = "./modules/infrastructure"
  google_project_region = var.google_project_region
  google_project        = var.google_project
}
