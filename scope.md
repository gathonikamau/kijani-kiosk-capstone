
---

# scope.md

```md
# KijaniKiosk Capstone Scope Document

## Problem Statement

KijaniKiosk previously lacked a production-grade delivery system. Deployments were manual, environments were not isolated, and there was no automated validation or observability. This created operational risk and made it difficult for engineers to safely ship changes.

---

## Project Objective

To design and implement an end-to-end DevOps delivery system that supports:
- Infrastructure provisioning
- Automated CI/CD delivery
- Environment separation
- Observability and monitoring
- Controlled production promotion

---

## Chosen Track

**Track A: Infrastructure-First**

This track focuses on infrastructure reproducibility, deployment automation, and observability.

---

## In-Scope Components

### Infrastructure
- Terraform-based provisioning of Kubernetes namespaces
- Ansible-based configuration management

### Application Delivery
- Kubernetes deployment manifests
- Environment-specific ConfigMaps (staging vs production)
- Docker-based containerized deployment

### CI/CD
- Jenkins pipeline
- Automated staging deployment on merge to main
- Smoke testing stage
- Manual approval gate for production

### Observability
- Log-based error rate monitoring (SLO model)
- Threshold-based failure detection (>5% error rate)

### Event-Driven System
- Receipt chain integration
- Staging bucket event processing

---

## Out of Scope

- Multi-region deployment
- Service mesh implementation
- Advanced APM tools (Datadog, New Relic)
- Auto-scaling policies (HPA tuning)
- Full production hardening (chaos engineering, DR testing)

---

## Success Criteria

The system is considered successful if:

- Infrastructure can be recreated from scratch using Terraform + Ansible
- A new deployment automatically triggers staging rollout
- Smoke tests run and block faulty releases
- Production deployment requires explicit approval
- Error rate can be computed from logs without external tools
- Receipt chain executes successfully in staging environment

---

## Key Engineering Decisions

### 1. Single Deployment Manifest
A single Kubernetes deployment is reused across environments to reduce drift.

### 2. ConfigMap Separation
Environment-specific configuration is isolated using ConfigMaps rather than separate deployments.

### 3. Log-Based Monitoring
Instead of external observability tools, structured logs are parsed to compute SLO metrics.

---

## Expected Outcome

A reproducible DevOps system that demonstrates:
- Real-world deployment discipline
- Controlled release engineering
- Observable system behavior
- Clear environment separation
