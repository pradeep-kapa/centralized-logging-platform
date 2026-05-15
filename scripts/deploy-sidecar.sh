#!/usr/bin/env bash
set -euo pipefail
kubectl apply -f k8s/sidecar/sample-service-sidecar.yaml
echo "Sidecar baseline deployed"
