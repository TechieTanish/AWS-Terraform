# AWS EKS Infrastructure Automation using Terraform

## 📌 Project Overview
This project automates the provisioning of a production-ready **Amazon EKS (Elastic Kubernetes Service)** cluster using **Terraform Modules**. 
It follows best practices by modularizing VPC, IAM, and EKS components for reusability and scalability.

## 🏗 Architecture
The infrastructure includes:
- **VPC Module**: Custom VPC with Public & Private subnets, NAT Gateway, and Internet Gateway.
- **IAM Module**: Roles and Policies for EKS Cluster and Managed Node Groups.
- **EKS Module**: 
  - Managed Node Groups (General-purpose & Spot instances).
  - OIDC Provider for IAM roles for Service Accounts.
  - Core Add-ons (VPC CNI, Kube-proxy).

## 🛠 Tech Stack
- **Cloud:** AWS
- **IaC:** Terraform
- **Container Orchestration:** Kubernetes (EKS)
- **Networking:** Custom VPC, Subnets, Security Groups

## 🚀 How to Use
1. **Clone the repo:** `git clone <your-repo-link>`
2. **Initialize Terraform:** `terraform init`
3. **Check the plan:** `terraform plan`
4. **Deploy:** `terraform apply -auto-approve`
