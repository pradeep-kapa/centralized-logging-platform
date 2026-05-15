# Sidecar to Fluent Bit migration

Fluent Bit is commonly deployed on Kubernetes as a DaemonSet, which makes it a natural replacement for per-Pod sidecar collection when the goal is cluster-wide node-level logging.[web:486][web:487]

```mermaid
flowchart TB
    subgraph Left[Before: Sidecar Model]
        subgraph LP1[Pod A]
            LA1[App]
            LS1[Sidecar]
        end
        subgraph LP2[Pod B]
            LA2[App]
            LS2[Sidecar]
        end
        LS1 --> LL[Loki]
        LS2 --> LL
    end

    subgraph Right[After: Fluent Bit DaemonSet Model]
        subgraph RN1[Node A]
            RA1[App Pods]
            RF1[Fluent Bit]
            RA1 --> RF1
        end
        subgraph RN2[Node B]
            RA2[App Pods]
            RF2[Fluent Bit]
            RA2 --> RF2
        end
        RF1 --> RL[Loki]
        RF2 --> RL
        RL --> RG[Grafana]
    end
```
