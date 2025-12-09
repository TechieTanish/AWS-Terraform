# Day 15: Cross-Region VPC Peering

## 🚀 Project Goal
To connect two separate AWS Virtual Private Clouds (VPCs) located in different regions (`us-east-1` and `us-west-2`) using **VPC Peering**, enabling private IP communication between EC2 instances in both networks.

## ⚙️ Key Components Deployed
* **Two VPCs:** With non-overlapping CIDRs (`10.0.0.0/16` and `10.1.0.0/16`).
* **VPC Peering Connection:** A secure, cross-region link between the two VPCs.
* **Route Tables:** Updated in **both** VPCs to direct traffic destined for the peer's network through the Peering Connection ID.
* **Security Groups:** Configured to allow ICMP (ping) and TCP traffic between the two VPC CIDR ranges.
* **EC2 Instances (x2):** One in each VPC for testing connectivity.

## ✅ Verification
The success of this setup is confirmed when you can:

1.  SSH into the Primary EC2 instance.
2.  Ping and curl (HTTP) the **private IP address** of the Secondary EC2 instance, and vice versa.

## 📝 Key Requirement
**CIDR Blocks MUST NOT OVERLAP** (e.g., `10.0.0.0/16` and `10.1.0.0/16`).

## 🛠️ Execution & Cleanup

| Command | Purpose |
| :--- | :--- |
| `terraform init` | Initialize the project. |
| `terraform apply` | Build all infrastructure (VPCs, EC2s, Peering, Routes). |
| `terraform output` | Get the necessary instance IPs for testing. |
| `terraform destroy` | **IMPORTANT:** Remove all created resources to avoid charges. |

---