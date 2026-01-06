# Kubernetes Troubleshooting Framework using Portainer (Terraform-based Setup)

This README explains a **step-by-step, production-grade Kubernetes troubleshooting framework** using **Portainer**, with the **entire infrastructure provisioned via Terraform**.

The goal is simple:

> **Debug faster, reduce kubectl fatigue, and maintain infra as code.**

---

## 1. Architecture Overview

Terraform provisions:

* Kubernetes Cluster (EKS / K3s / Kind – environment agnostic)
* Portainer (via Helm or manifest)
* Namespaces, RBAC, Resource Quotas

Portainer is then used for **day-to-day troubleshooting**, not cluster creation.

---

## 2. Terraform Responsibilities (Source of Truth)

Terraform handles:

* Cluster lifecycle
* Portainer installation
* Node sizing (CPU / Memory)
* Baseline resource limits
* Networking primitives

⚠️ **Important Rule**

> Terraform creates and defines. Portainer inspects, debugs, and fixes runtime issues.

---

## 3. Initial Application Health Check (via Portainer)

Once infra is up, troubleshooting starts inside Portainer.

### Step 1: Namespace Scan

* Navigate to **Namespaces**
* Green = healthy
* Red = failing pod or deployment

### Step 2: Workload Status

* Check Deployments / Pods
* Look for:

  * CrashLoopBackOff
  * ImagePullBackOff
  * Pending

### Step 3: Networking Verification

* Validate Services & Ingress
* Confirm LoadBalancer URL / NodePort

---

## 4. Common Production Errors & Fixes

### Error 1: ImagePullBackOff

**Root Cause**

* Wrong image tag
* Typo in image name
* Missing imagePullSecret

**Fix (Portainer)**

* Open Deployment → YAML tab
* Verify image name and tag
* Apply changes

Terraform Note:

> Image references should ideally come from Terraform variables or Helm values to avoid drift.

---

### Error 2: Application Connection Failure (500 Error)

**Root Cause**

* Wrong service name
* Incorrect port mapping
* Bad environment variables

**Fix (Portainer)**

* Edit Deployment YAML
* Verify ENV variables (host, port)
* Re-deploy

Terraform Note:

> Service names and ports should match Terraform-defined services.

---

### Error 3: CrashLoopBackOff (OOMKilled)

**Root Cause**

* Insufficient memory or CPU

**How to Detect**

* Pod logs
* Pod describe → Exit code 137

**Fix (Portainer)**

* Increase resource limits in YAML

Terraform Note:

> Resource limits should be standardized using Terraform or Helm values in production.

---

## 5. Cluster & Node-Level Investigation

### Node Resource Pressure

* Check CPU / Memory utilization per node
* Identify imbalance

### Orphan / Debug Pods

* Temporary debugging pods often consume resources
* Identify and delete unused pods

Terraform Note:

> Node scaling rules should be managed via Terraform autoscaling policies.

---

## 6. Proactive Monitoring & Alerting

### Alerts

* Configure alerts in Portainer
* CPU > 60%
* Memory saturation

### Notifications

* Slack / Microsoft Teams via Webhooks

Terraform Note:

> Monitoring stack (Prometheus / Alertmanager) should be provisioned via Terraform.

---

## 7. Production Best Practices

### Logs First, Always

* Use live pod logs before running kubectl describe

### Resource Quotas

* Prevent namespace-level resource exhaustion

### ConfigMaps & Secrets

* Missing keys cause silent failures

### Health Probes

* Validate liveness & readiness probes
* Incorrect probes can kill healthy pods

---

## 8. Terraform + Portainer Workflow (Recommended)

1. Provision infra using Terraform
2. Deploy applications
3. Observe & troubleshoot using Portainer
4. Backport critical fixes into Terraform or Helm

> **Terraform defines stability. Portainer provides visibility.**

---

## 9. Why This Approach Works

* No 50 terminals open
* Faster RCA (Root Cause Analysis)
* Cleaner separation of concerns
* Infra remains reproducible

---

## Final Note

Portainer is not a replacement for Terraform.
It is a **debugging cockpit** sitting on top of Terraform-managed infrastructure.

Used together, they form a **production-safe Kubernetes operating model**.

🚀
