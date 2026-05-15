# Migration: Fluent Bit to OpenTelemetry

## Why evolve

Fluent Bit is excellent for focused log collection, but OpenTelemetry Collector becomes attractive when the platform needs broader telemetry support and more flexible processing. The filelog receiver is the de facto solution for Kubernetes file-based logs in OTel, and official agent-to-gateway patterns are documented for larger deployments.[web:419][web:444]

## Main steps
- Keep Loki and Grafana stable during the migration.[web:457]
- Introduce OTel agents that read container logs from node-mounted paths.
- Add an optional gateway deployment for central routing and processing.[web:444]
- Export logs to Loki and compare complexity versus flexibility.
