# go_app

## Simple go_app for creating infrastructure around it

## Point to do

- Add Jaeger
- Add code to app tha can create rows in db
- Add secret for db access
- Add Vault to keep secrets
- Add db for Golang code
- Add db in infrastructure
- Create backup/restore process
- Update README later

## Github workflows

Added simple workflow for testing Terraform code

## Infrastructure

Added components:

- Kubernetes cluster (use Google Cloud)
    1. add your project as a variable
- Grafana (official chart)
- Prometheus (official chart)
- Loki (as an aggregator of logs)
- Traefik (need to test)
- Jaeger (need to test):
    1. Need kubeconfig for the yaml
    1. Config cert-manager for Jaeger

## FIXME: Update README later

<!-- namespace deleted before helm chart -->
