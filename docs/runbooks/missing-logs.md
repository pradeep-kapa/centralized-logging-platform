# Runbook: missing logs

## Checks
- Confirm the application writes to stdout/stderr.
- Confirm node log files exist.
- Verify collector input paths.
- Check Loki label filters in Grafana.
- Inspect collector logs for dropped or unparsable entries.
