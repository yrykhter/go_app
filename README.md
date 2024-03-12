# go_app

## Simple go_app for creating infrastructure around it

## Points to do

- Add some options for tools
- Update naming for vars
- Add Jaeger
- Add FluxCD/ArgoCD - ???
- Configure Traefik as load balancer/ add another option
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
- Use best practices(bp) for Dockerfile
- Use bp for k8s
- Use bp for Golang code

## Github workflows

Added simple workflow for testing:

- Terraform code
- Markdown
- YAML
- GoLang

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

## Known issues

1. namespace deleted before helm chart (update other modules as Jaeger)
1. config cert-manager for Jaeger
