# Day 06: Terraform File Structure and Organization

This directory contains the refactored Terraform configuration from Day 5, demonstrating best practices for file organization and Separation of Concerns.

## 🚀 Goal

The primary goal of Day 6 was to transition from a monolithic `main.tf` file to a modular, organized structure. This ensures the configuration is scalable, maintainable, and easy to navigate for team collaboration.

## 📂 File Structure Overview

The configuration is split into logical files based on the recommended Terraform conventions:

| File Name | Purpose |
| :--- | :--- |
| `backend.tf` | Defines the remote state configuration (S3 backend). |
| `provider.tf` | Configures the AWS provider and required Terraform versions/providers. |
| `variables.tf` | Defines all input variables (e.g., `region`, `environment`, `vpc_cidr`). |
| `locals.tf` | Defines local variables and common tags for dynamic naming and tagging. |
| `terraform.tfvars` | Contains the actual values for the input variables (used during execution). |
| `vpc.tf` | Defines all Networking Resources: VPC, Internet Gateway, Subnets, and Route Tables. |
| `storage.tf` | Defines all Storage Resources: S3 Bucket, Versioning, and Public Access Block. |
| `outputs.tf` | Defines all output values (e.g., VPC ID, Subnet IDs, S3 Bucket Name). |

## ⚙️ How to Deploy

To deploy this infrastructure, follow the standard Terraform workflow:

1.  **Initialize:** Prepare the working directory and download provider plugins.
    ```bash
    terraform init
    ```
2.  **Validate:** Check the configuration syntax and structure.
    ```bash
    terraform validate
    ```
3.  **Plan:** Review the changes Terraform intends to make (using values from `terraform.tfvars`).
    ```bash
    terraform plan
    ```
4.  **Apply:** Execute the planned changes to create the resources in AWS.
    ```bash
    terraform apply
    ```

## ✅ Key Learning Points

* **Separation of Concerns:** Grouping resources by their function (e.g., all networking in `vpc.tf`).
* **Lexicographical Loading:** Understanding that Terraform merges all `.tf` files in alphabetical order.
* **Essential Files:** Proper use of `variables.tf`, `locals.tf`, and `outputs.tf` for structured configuration.

![day06](<day 06.png>)