# terraform-gke-shared-vpc-platform

Runnable, production-aligned GKE Terraform baseline (Phase 1).

## Status
 Starter structure ready.

## Goals
- Private GKE cluster
- Modular Terraform structure
- Workload Identity
- Namespaces: microservices, legacy
- Cost-aware demo defaults

## Quick Start (Planned)
```bash
cd environments/demo
terraform init
terraform plan
terraform apply
```

See docs/architecture.md for design overview.

## Project Structure
```txt
terraform-gke-shared-vpc-platform/
├── modules/
│   ├── project_services/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── gke/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── namespaces/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── workload_identity/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── environments/
    └── demo/
        ├── backend.tf
        ├── providers.tf
        ├── versions.tf
        ├── variables.tf
        ├── main.tf
        ├── outputs.tf
        └── terraform.tfvars.example
```
