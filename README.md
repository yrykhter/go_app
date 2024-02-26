# go_app

## Simple go_app for creating infrastructure around it

## Point to do

- Add some options for tools
- Update naming for vars
- Add Jaeger
- Add FluxCD/ArgoCD - ???
- Configure Traefik as load balancer
- Do I need cert-manager ???
- Update all configs
- Add code to app that can create rows in db (CRUD)
- Add secret for db access
- Add Vault to keep secrets
- Add db for Golang code
- Add db in infrastructure
- Decide what kind of db to use
- Create backup/restore process
- Add README to all modules
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

## Known issues

1. namespace deleted before helm chart
