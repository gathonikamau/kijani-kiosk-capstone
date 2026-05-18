# Project Scope — KijaniKiosk CI/CD System

## Problem Statement

KijaniKiosk requires a reliable deployment pipeline to support containerized microservices with staging and production environments.

---

## Objectives

- Build a CI/CD pipeline using Jenkins
- Deploy services to Kubernetes (Kind cluster)
- Separate staging and production environments
- Introduce manual approval gate for production deployments
- Demonstrate Docker-based build pipeline

---

## In Scope

- Jenkins pipeline definition
- Docker image builds
- Kubernetes deployment manifests
- Namespace isolation (staging & production)
- Basic smoke test stage
- Manual approval gate

---

## Out of Scope

- Full production cloud deployment
- Automated observability stack (Prometheus/Grafana fully integrated)
- High availability Kubernetes cluster
- Fully automated infrastructure provisioning

---

## Success Criteria

- Pipeline structure executes end-to-end design
- Staging deployment is defined and partially validated
- Production deployment is gated by approval step
- Kubernetes cluster is functional and accessible
