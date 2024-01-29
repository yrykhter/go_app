resource "helm_release" "jaeger_operator" {
  repository = var.jaeger_operator_chart_repository
  name       = "jaeger-operator"
  namespace = var.jaeger_namespace
  chart      = "jaeger-operator"
  version    = var.jaeger_operator_chart_version
  timeout    = 3600
}

resource "kubectl_manifest" "jaeger" {
  depends_on = [helm_release.jaeger_operator]
  yaml_body = templatefile("${path.module}/jaeger.yaml", {})
}

resource "kubernetes_namespace" "observability" {
  metadata {
    name = var.jaeger_namespace
  }
}
