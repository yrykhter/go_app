# go_app

## Simple go_app for creating infrastructure around it

## Github workflows

Added simple workflow for testing Terraform code

## Infrastructure

Use official helm charts for Prometheus and Grafana!

Added components:

- Kube-operator (+ Grafana)
- Jaeger (need to test):
    1. Need kubeconfig for the yaml
    1. Config cert-manager for Jaeger
- Loki (as an aggregator of logs)
- Traefik (need to test)
- Kubernetes cluster (creation in Google Cloud)
    1. add your project as a variable

## FIXME: Update README later

<!-- namespace deleted before helm chart -->
