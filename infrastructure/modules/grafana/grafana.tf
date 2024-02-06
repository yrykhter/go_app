resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = var.namespace
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"

  values = [
    "${file("${path.module}/values.yaml")}"
  ]

}
