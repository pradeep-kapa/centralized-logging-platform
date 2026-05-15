#!/usr/bin/env bash
set -euo pipefail
kubectl apply -f k8s/fluent-bit/fluent-bit-rbac.yaml
kubectl apply -f k8s/fluent-bit/fluent-bit-configmap.yaml
kubectl apply -f k8s/fluent-bit/fluent-bit-daemonset.yaml
echo "Fluent Bit deployed"
