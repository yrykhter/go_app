resource "helm_release" "loki" {
  name       = "loki"
  namespace  = var.namespace
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"

  #   values = [
  #     "${file("${path.module}/values.yaml")}"
  #   ]

}
