# KijaniKiosk Capstone: End-to-End DevOps Delivery System

## Overview

This project implements a production-approaching DevOps delivery system for the KijaniKiosk `kk-payments` service. It demonstrates full lifecycle engineering including infrastructure provisioning, CI/CD automation, environment separation, observability, and event-driven integration.

The system evolves a previously manual deployment process into a structured, reproducible, and auditable delivery pipeline.

---

## Key Capabilities

- Infrastructure as Code using Terraform
- Configuration management using Ansible
- Kubernetes-based deployment for staging and production
- CI/CD pipeline using Jenkins with approval gates
- Environment-specific configuration using ConfigMaps
- Log-based observability for error rate tracking (SLO-style)
- Receipt chain integration using event-driven architecture

---

## Architecture Summary

The system follows a staged delivery flow:

1. Code is pushed to `main`
2. Jenkins builds and tests the application
3. Deployment is applied to staging automatically
4. Smoke tests validate staging deployment
5. Manual approval gate controls promotion to production
6. Production deployment is executed after approval

---

## Environments

### Staging
- Namespace: `kijani-staging`
- DB Host: `staging-db.internal`
- Receipts bucket: `kk-payments-receipts-staging`

### Production
- Namespace: `default`
- DB Host: `prod-db.internal`

---

## CI/CD Pipeline Flow

- Build Docker image
- Deploy to staging
- Run smoke tests
- Wait for approval
- Deploy to production

---

## Observability

A log-based SLO monitoring script calculates error rate:

- Reads structured logs from `kk-payments`
- Computes error percentage
- Flags SLO breach if error rate > 5%

---

## Receipt Processing

The system includes a receipt chain:
- Payment events emitted by `kk-payments`
- Events written to staging bucket
- Receipt worker processes and stores receipts

---

## Repository Structure

