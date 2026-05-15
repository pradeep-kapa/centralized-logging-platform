#!/usr/bin/env bash
set -euo pipefail
kubectl apply -f k8s/otel/otel-collector-config.yaml
kubectl apply -f k8s/otel/otel-daemonset.yaml
echo "OTel Collector deployed"
