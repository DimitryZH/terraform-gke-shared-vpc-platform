# Architecture Overview

Phase 1 provisions:

- Custom VPC
- Subnet with secondary ranges
- Private GKE cluster
- General node pool (+ optional spot pool)
- Workload Identity
- Namespaces: microservices, legacy

## Design Intent

- Use official Google GKE module.
- Thin custom modules for composition.
- Single-project runnable baseline.
- Structured to evolve into Shared VPC architecture later.
