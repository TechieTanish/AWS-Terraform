# Day 17: AWS Elastic Beanstalk Blue-Green Deployment Demo

This demo replicates the Azure App Service deployment slot functionality using **AWS Elastic Beanstalk** to achieve zero-downtime deployments through blue-green deployment strategy.

## 🎯 What This Demo Does

This Terraform project creates:
- **Blue Environment** (Production) - Running Application v1.0
- **Green Environment** (Staging) - Running Application v2.0
- Complete infrastructure with load balancers, auto-scaling, and health checks
- Ability to instantly swap traffic between environments with zero downtime

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                  Elastic Beanstalk Application              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────────────┐      ┌──────────────────────┐   │
│  │  Blue Environment    │      │  Green Environment   │   │
│  │  (Production)        │      │  (Staging)           │   │
│  ├──────────────────────┤      ├──────────────────────┤   │
│  │  Version 1.0         │      │  Version 2.0         │   │
│  │  Load Balancer       │      │  Load Balancer       │   │
│  │  Auto Scaling        │      │  Auto Scaling        │   │
│  │  Health Checks       │      │  Health Checks       │   │
│  │                      │      │                      │   │
│  │  URL: my-app-blue... │      │  URL: my-app-green..│   │
│  └──────────────────────┘      └──────────────────────┘   │
│           │                              │                 │
│           └──────────────┬───────────────┘                 │
│                          │                                 │
│                 CNAME Swap (Instant)                       │
└─────────────────────────────────────────────────────────────┘
```

## 📋 Prerequisites

1. **AWS Account** with appropriate permissions
2. **Terraform** (>= 1.0) installed
3. **AWS CLI** configured with credentials
4. **PowerShell** (for packaging scripts)
5. **Node.js** (optional, for local testing)

## 🚀 Quick Start

### Step 1: Package the Applications

First, package both versions of the application:

```powershell
.\package-apps.ps1
```

This creates:
- `app-v1/app-v1.zip` - Version 1.0 (Blue)
- `app-v2/app-v2.zip` - Version 2.0 (Green)

### Step 2: Initialize Terraform

```bash
terraform init
```

### Step 3: Review the Plan

```bash
terraform plan
```

### Step 4: Deploy Infrastructure

```bash
terraform apply
```

⏳ **Note:** The deployment takes approximately 15-20 minutes as Elastic Beanstalk provisions:
- EC2 instances
- Application Load Balancers
- Auto Scaling Groups
- Security Groups
- CloudWatch monitoring

### Step 5: View the Outputs

After deployment completes, Terraform will display:

```bash
terraform output instructions
```

You'll see the URLs for both environments:
- **Blue Environment (Production):** `http://my-app-bluegreen-blue-xxxxxx.elasticbeanstalk.com`
- **Green Environment (Staging):** `http://my-app-bluegreen-green-xxxxxx.elasticbeanstalk.com`

## 🔵 Testing the Blue Environment (Production - v1.0)

Visit the Blue environment URL. You should see:
- **Version 1.0** displayed prominently
- **Blue color scheme**
- **"PRODUCTION" badge**
- Basic feature set

## 🟢 Testing the Green Environment (Staging - v2.0)

Visit the Green environment URL. You should see:
- **Version 2.0** displayed prominently
- **Green color scheme**
- **"STAGING" badge**
- New features listed:
  - Refreshed UI with modern design
  - Improved performance
  - Enhanced security features
  - Better analytics tracking
  - Critical bug fixes

## 🔄 Performing the Blue-Green Swap

Once you've verified the Green environment is working correctly, perform the swap:

## 🎓 What You've Learned

✅ How to implement blue-green deployments on AWS  
✅ Elastic Beanstalk environment management  
✅ Zero-downtime deployment strategies  
✅ Infrastructure as Code with Terraform  
✅ AWS CLI for environment swapping  
✅ Production-safe deployment practices  
