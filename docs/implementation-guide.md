# Implementation guide

## Phase 1: baseline
- Build and push the sample service image.
- Deploy Loki, Grafana, and Prometheus.
- Deploy the sample app with a sidecar collector.
- Verify logs in Grafana Explore.

## Phase 2: Fluent Bit migration
- Remove sidecars from the app manifests.
- Deploy Fluent Bit as a DaemonSet.[web:486]
- Mount host log paths and enable Kubernetes metadata enrichment.[web:487]
- Verify logs still reach Loki.

## Phase 3: OpenTelemetry evolution
- Deploy the OTel Collector with filelog receiver.[web:419]
- Keep Loki as the backend via OTel-compatible ingestion path.[web:457]
- Optionally split Collectors into agents and gateways.[web:444]
