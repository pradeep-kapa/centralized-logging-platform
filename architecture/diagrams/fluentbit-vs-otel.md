# Fluent Bit to OpenTelemetry evolution

The OpenTelemetry Collector filelog receiver is the de facto way to collect Kubernetes file-based logs, and the Collector supports official agent-to-gateway deployment patterns for more scalable telemetry pipelines.[web:419][web:444]

```mermaid
flowchart TB
    subgraph Left[Fluent Bit]
        subgraph FN1[Node A]
            FA1[App Pods]
            FF1[Fluent Bit DaemonSet]
            FA1 --> FF1
        end
        subgraph FN2[Node B]
            FA2[App Pods]
            FF2[Fluent Bit DaemonSet]
            FA2 --> FF2
        end
        FF1 --> FL[Loki]
        FF2 --> FL
    end

    subgraph Right[OpenTelemetry]
        subgraph ON1[Node A]
            OA1[App Pods]
            OA2[OTel Agent]
            OA1 --> OA2
        end
        subgraph ON2[Node B]
            OB1[App Pods]
            OB2[OTel Agent]
            OB1 --> OB2
        end
        OGW[OTel Gateway]
        OA2 --> OGW
        OB2 --> OGW
        OGW --> OL[Loki]
    end
```
