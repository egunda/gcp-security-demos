# GCP Security Demos

A comprehensive collection of Terraform-managed infrastructure demos showcasing Google Cloud Platform's (GCP) enterprise security products. This repository provides a reference architecture for deploying and managing security controls as code.

---

## 🚀 Overview

This project implements a multi-environment (Dev/Prod) setup focusing on defense-in-depth strategies. It covers everything from edge security with Cloud Armor to runtime protection with Model Armor.

### 🛡️ Key Security Products Included

1.  **Cloud Armor & WAF**: Custom security policies, rate-limiting, and reCAPTCHA Enterprise integration to protect against Layer 7 attacks and bots.
2.  **Identity-Aware Proxy (IAP)**: Zero-Trust access control for Cloud Run services and Cloud SQL databases without requiring a VPN.
3.  **Network Security**:
    *   **Cloud IDS/IPS**: Intrusion detection and prevention (NGFW) to monitor and block malicious traffic.
    *   **VPC Security**: Custom routes, firewalls, and Private Service Connect (PSC).
4.  **Security Command Center (SCC)**: Integration with SCC for centralized vulnerability management and threat detection.
5.  **Model Armor**: Runtime safety and security for Generative AI applications, screening prompts and responses for sensitive data and malicious patterns.
6.  **Serverless Security**: VPC Service Controls (VPC-SC) perimeters, Cloud KMS encryption, and Service Account hardening for Cloud Functions and Cloud Run.
7.  **Data Loss Prevention (DLP)**: Inspection and masking of sensitive data.
8.  **Workforce Identity Federation**: Integration with external OIDC providers (e.g., Okta) for managing access to GCP resources.

---

## 🏗️ Repository Architecture

```text
.
├── environments/           # Environment-specific configurations
│   ├── dev/                # Development environment
│   └── prod/               # Production environment
├── functions/              # Source code for Cloud Functions (Security Remediators, etc.)
├── modules/                # Reusable Terraform modules
│   ├── cloud_ids/          # Cloud IDS setup
│   ├── firebot/            # Internal security bots
│   ├── gke_cluster/        # Secure GKE configurations
│   └── ...                 # Other infra modules
├── www/                    # Demo frontend assets (e.g., reCAPTCHA demo)
└── cloudbuild.yaml         # CI/CD pipeline for automated deployments
```

---

## � Cloud Functions Reference

The `functions/` directory contains event-driven Python microservices that handle everything from automated remediation to notification routing.

### 🔐 Security & Remediation
*   **`remediate-bucket` / `remediate-firewall` / `remediate-instance`**: Automated response functions that trigger via Slack/SCC to roll back insecure configuration changes (e.g., deleting a risky firewall rule or closing a public GCS bucket).
*   **`scc-remediation`**: Central orchestrator that receives Slack interactive payloads and routes them to specific remediation functions.
*   **`mute-finding` / `deactivate-finding`**: Managed workflows to acknowledge or suppress findings in Security Command Center directly from Slack.
*   **`provision-access`**: Implements Just-In-Time (JIT) access patterns, adding temporary IAM roles to users upon approval.
*   **`model-armor`**: Integrates with the Model Armor API to screen Generative AI prompts for security risks before they reach the LLM.

### 📢 Notifications & ChatOps
*   **`scc-slack-notification`**: Transformers that convert raw SCC findings into rich, interactive Slack messages.
*   **`scc-jira-notification`**: Automatically creates and syncs Jira issues based on Security Command Center findings.
*   **`iam-notification` / `identity-notification` / `instance-notification`**: Dedicated alerts for specific resource lifecycle changes (e.g., new IAM policy bindings or VM creations).
*   **`approval-notification` / `deploy-notification`**: Hooks for CI/CD pipelines to alert security teams of pending infrastructure changes.

### 🛠️ Infrastructure & Demos
*   **`cloud-hsm-demo`**: Demonstrates manual asymmetric decryption using Cloud HSM (Hardware Security Module) backed keys.
*   **`dlp-scan-storage` / `dlp-scan-bq-remote`**: Implementation of Data Loss Prevention (DLP) scans for files in GCS and datasets in BigQuery.
*   **`recaptcha-backend`**: Validates reCAPTCHA Enterprise assessments received from the demo frontend.
*   **`mfa-status`**: Queries Cloud Identity to report on users who are not yet enrolled in 2FA/MFA.
*   **`admin-access` / `deploy-approval`**: Backend logic for ChatOps-based approval workflows.

---

## �🛠️ Deployment Steps

This project is designed to be deployed into a **brand new GCP Project**.

### 1. Prerequisites

*   **Google Cloud Project**: Created and attached to a billing account.
*   **Permissions**: The service account/identity running Terraform must have `Owner` or `Editor` + `Project IAM Admin` roles.
*   **Organization ID**: Required for some organization-level security policies and Workforce Identity Federation.

### 2. Local Initialization

Clone this repository and navigate to the desired environment (e.g., `dev`):

```bash
git clone https://github.com/egunda/gcp-security-demos.git
cd gcp-security-demos/environments/dev
```

### 3. Configure Variables

Update the `terraform.tfvars` file with your specific project details:

```hcl
project      = "YOUR_PROJECT_ID"
organization = "YOUR_ORG_ID"
region       = "us-central1"
iap_user     = "user@your-domain.com"
# ... set other demo flags to true/false as needed
```

### 4. Initialize and Apply

Since this is a fresh project, the GCS backend is commented out in `backend.tf`. Terraform will use a local state file initially.

```bash
terraform init
terraform plan
terraform apply
```

### 5. Automated Deployment (CI/CD)

The included `cloudbuild.yaml` allows for GitOps-style deployments.
1.  Connect your GitHub repository to **Cloud Build**.
2.  Create a trigger that runs on pushes to the `main` branch.
3.  Ensure the Cloud Build Service Account has the necessary IAM permissions to manage infrastructure.

---

## 🛡️ Security Best Practices Followed

*   **Least Privilege**: Dedicated Service Accounts for each Cloud Function and Cloud Run service.
*   **Infrastructure as Code (IaC)**: Eliminating manual configuration drift.
*   **Secret Management**: Sensitive tokens (Slack, API keys) are stored in Google Cloud Secret Manager.
*   **Encryption**: Using Cloud KMS for customer-managed encryption keys (CMEK).
*   **VPC Isolation**: Strict subnetworking and VPC Service Controls (VPC-SC).

---

## 📜 License

Copyright 2026 Google LLC. Licensed under the Apache License, Version 2.0.
