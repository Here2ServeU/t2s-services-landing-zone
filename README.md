# T2S Services Landing Zone - Multi-Cloud Terraform Infrastructure

## Overview

This repository provides a modular, environment-based Terraform infrastructure setup for deploying a secure, scalable Landing Zone across AWS, Azure, and Google Cloud (GCP).

Each cloud provider includes:
- Remote Backend setup
- Organizational Hierarchy (OU, Management Groups, Folders)
- Policy enforcement (Guardrails, SCPs, Org Policies)

Supported environments:
- dev, stage, prod

## Structure

```
t2s-services-landing-zone/
├── aws/
│   ├── modules/{backend, org-structure, policies}
│   └── environments/{dev, stage, prod}
├── azure/
│   ├── modules/{backend, org-structure, policies}
│   └── environments/{dev, stage, prod}
├── gcp/
│   ├── modules/{backend, org-structure, policies}
│   └── environments/{dev, stage, prod}
├── terraform.tf
├── versions.tf
└── README.md
```

## How to Use

### Step 1: Initialize Backend (per environment)

Example for AWS dev:

```bash
cd aws/environments/dev
terraform init
terraform apply -target=module.backend
```

### Step 2: Configure backend.tf

Fill the `backend.tf` block with your remote state config once created.

### Step 3: Apply Full Infrastructure

```bash
terraform init
terraform apply
```

## Cloud-Specific Resources

### AWS

- Backend: S3 + DynamoDB for state management
- Org Structure: AWS Organizations + OUs
- Policies: AWS Control Tower Guardrails

### Azure

- Backend: Azure Storage Account + Container
- Org Structure: Management Groups
- Policies: Azure Policy Definitions + Assignments

### GCP

- Backend: GCS Bucket with versioning
- Org Structure: GCP Folders under Org ID
- Policies: Google Org Policy constraints

## Security

All cloud environments use:
- Encrypted remote backends
- Organizational boundaries
- Policies to deny insecure configurations (e.g., public IPs)

## Tooling

- Terraform >= 1.4.0
- Providers:
  - hashicorp/aws
  - hashicorp/azurerm
  - hashicorp/google