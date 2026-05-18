# KijaniKiosk Capstone Project — CI/CD Delivery System

## Overview

This project implements a CI/CD pipeline for the KijaniKiosk system using Jenkins, Docker, and Kubernetes (Kind). The system demonstrates containerized deployment, multi-environment Kubernetes configuration, and staged deployment with approval gates.

The goal of this project was to simulate a production-grade delivery pipeline and document real-world challenges in infrastructure integration.

---

## Architecture Summary

- Jenkins (CI/CD Orchestrator)
- Docker (Containerization)
- Kubernetes (Kind Cluster)
- kubectl (Deployment Interface)

---

## Environments

- Staging: `kijani-staging`
- Production: `production`

---

## Pipeline Flow

1. Checkout source code
2. Build Docker image
3. Deploy to staging namespace
4. Manual approval gate
5. Deploy to production namespace

---

## Known Limitations

- Pipeline execution is dependent on manual environment setup
- Kubernetes access inside Jenkins requires kubeconfig tuning
- Docker CLI must be installed inside Jenkins container
- Smoke tests are placeholder implementations

---

## What Works

- Kubernetes cluster is functional (Kind)
- Namespaces are correctly provisioned
- Docker builds succeed in host environment
- Jenkins pipeline structure is fully defined
- Staging and production manifests are valid

---

## Lessons Learned

- CI/CD systems depend heavily on environment consistency
- Containerized CI introduces networking and auth complexity
- Kubernetes context mismatch is a common failure point
- Infrastructure as Code must include toolchain setup, not just resources

---

## Future Improvements

- Build custom Jenkins image with preinstalled tools
- Fully automate cluster provisioning via Terraform
- Add Prometheus monitoring for deployment validation
- Implement real smoke tests for kk-payments service
