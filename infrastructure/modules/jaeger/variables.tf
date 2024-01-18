variable "jaeger_operator_chart_version" {
  type        = string
  description = "Version of the jaeger-operator chart"
  default     = "2.25.0"
}
variable "jaeger_operator_chart_repository" {
  type        = string
  description = "Repository of the jaeger-operator chart"
  default     = "https://jaegertracing.github.io/helm-charts"
}
variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}
