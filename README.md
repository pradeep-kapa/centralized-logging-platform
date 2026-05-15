# centralized-logging-platform

A Kubernetes **centralized logging** project that demonstrates an architecture journey from sidecar-based log collection to Fluent Bit DaemonSets and then to OpenTelemetry Collector evolution. Fluent Bit is commonly deployed as a DaemonSet in Kubernetes so it can run on every node and collect container logs centrally, while OpenTelemetry Collector supports agent and agent-to-gateway deployment patterns for broader telemetry expansion.[web:486][web:444][web:474]

The platform standardizes on **Grafana Loki + Grafana** for logs and dashboards, while **Prometheus** is included for metrics visibility. Loki is built around label-based log streams and retention controls, which makes label strategy and retention policy important architecture decisions rather than implementation afterthoughts.[web:442][web:411][web:457]

## What this project shows

- **Phase 1:** Sidecar-based log collection for baseline comparison.
- **Phase 2:** Migration to **Fluent Bit DaemonSet** for node-level collection.[web:486][web:487]
- **Phase 3:** Optional evolution to **OpenTelemetry Collector** using filelog receiver and agent-to-gateway architecture.[web:419][web:444]
- Stable backend pattern using **Loki + Grafana** across all phases.[web:457]

## Stack

| Layer | Technology | Role |
|---|---|---|
| Platform | Kubernetes | Runtime for Pods, DaemonSets, and services [web:486] |
| Baseline collection | Sidecar collector | Initial architecture for comparison |
| Node-level collection | Fluent Bit | Lightweight per-node log collection [web:486][web:487] |
| Evolution path | OpenTelemetry Collector | Agent/gateway telemetry pipeline [web:419][web:444] |
| Log backend | Grafana Loki | Centralized log storage and query [web:442][web:411] |
| Dashboards | Grafana | Log search and dashboards [web:457] |
| Metrics | Prometheus | Platform monitoring |
| Diagrams | Mermaid | Diagrams as code |

## Repository layout

```text
centralized-logging-platform/
├── README.md
├── architecture/
│   ├── blueprint.md
│   └── diagrams/
│       ├── baseline-sidecar.md
│       ├── sidecar-vs-fluentbit.md
│       ├── fluentbit-vs-otel.md
│       └── target-state.md
├── docs/
│   ├── implementation-guide.md
│   ├── migration-sidecar-to-fluentbit.md
│   ├── migration-fluentbit-to-otel.md
│   └── runbooks/
│       ├── ingestion-failure.md
│       └── missing-logs.md
├── apps/
│   └── sample-service/
│       ├── app.py
│       ├── Dockerfile
│       └── requirements.txt
├── k8s/
│   ├── sidecar/
│   ├── fluent-bit/
│   ├── loki/
│   ├── grafana/
│   ├── prometheus/
│   └── otel/
├── helm/
│   ├── sample-service/
│   └── observability-stack/
├── scripts/
└── .github/workflows/
```

## Quick start

1. Deploy Loki, Grafana, and Prometheus manifests.
2. Deploy the sample service with the sidecar model.
3. Verify logs in Grafana Explore.
4. Migrate to Fluent Bit DaemonSet and compare the operational model.
5. Add the OTel manifests when ready for the Part 2 architecture.[web:486][web:444]

## Key design notes

Loki labels should remain low-cardinality because labels define streams and can strongly affect storage and query behavior.[web:442] When moving to Fluent Bit, Kubernetes metadata enrichment should be preserved so logs remain searchable by namespace, Pod, and container context.[web:487] When moving to OpenTelemetry, the filelog receiver is the de facto log collection mechanism for Kubernetes file-based logs, but it is more configuration-heavy than a simpler shipper.[web:419]
