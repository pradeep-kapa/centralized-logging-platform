# Migration: sidecar to Fluent Bit

## Why migrate

A sidecar collector is easy to reason about, but it creates one collector per workload Pod. Fluent Bit simplifies this by running once per node as a DaemonSet, which is the recommended Kubernetes deployment pattern for Fluent Bit.[web:486]

## Main steps
- Remove sidecar containers from application Pods.
- Deploy the Fluent Bit service account, RBAC, ConfigMap, and DaemonSet.
- Mount `/var/log` and container log paths into the DaemonSet Pod.
- Enable the Kubernetes filter for metadata enrichment.[web:487]
- Validate ingestion in Loki and queries in Grafana.
