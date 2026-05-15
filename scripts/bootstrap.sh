#!/usr/bin/env bash
set -euo pipefail
kubectl apply -f k8s/loki/
kubectl apply -f k8s/grafana/
kubectl apply -f k8s/prometheus/
echo "Base observability components deployed"
