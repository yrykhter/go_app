resource "helm_release" "traefik" {
  create_namespace = false
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "v1.13.3"

  set {
    name  = "installCRDs"
    value = true
  }
}
