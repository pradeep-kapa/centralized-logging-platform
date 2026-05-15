# Centralized Logging Platform Blueprint

## Overview

This repository models a staged Kubernetes logging evolution: sidecar baseline, Fluent Bit DaemonSet migration, and optional OpenTelemetry Collector evolution. Fluent Bit documentation recommends Kubernetes deployment through a DaemonSet, while OpenTelemetry documents official gateway and agent-to-gateway deployment patterns for the Collector.[web:486][web:444][web:474]

The platform preserves **Loki + Grafana** as the steady backend and visualization layer. Loki retention and label strategy remain shared concerns across all phases of the architecture.[web:411][web:442]

## Phase 1: sidecar baseline

Each application Pod runs with a sidecar collector. This creates a clear baseline but duplicates collectors and configuration across workloads.

## Phase 2: Fluent Bit DaemonSet

Fluent Bit runs once per node as a DaemonSet and reads node-level container logs. The Kubernetes filter enriches records with workload metadata before forwarding to Loki.[web:486][web:487]

## Phase 3: OpenTelemetry evolution

OTel agents collect logs from files on each node and optionally forward them to gateway Collectors. Loki remains the log backend while the telemetry model becomes more extensible.[web:419][web:444][web:457]
