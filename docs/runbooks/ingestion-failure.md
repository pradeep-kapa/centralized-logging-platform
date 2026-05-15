# Runbook: ingestion failure

## Symptoms
- Logs stop appearing in Grafana Explore.
- Collector Pods show retry errors.
- Loki ingestion endpoints return errors.

## Checks
- Verify collector Pod health.
- Check Loki service and endpoints.
- Review RBAC and mounted log paths.
- Confirm metadata enrichment and output configuration.
