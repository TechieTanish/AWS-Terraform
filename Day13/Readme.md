# Day 13: Terraform Data Sources with AWS - Launch Without Ownership

## 🎯 The Challenge: Reference, Not Manage

You want to integrate your new application (an EC2 instance) into an existing, robust network. You know the network is there, managed perfectly by another team (or another configuration).

**The fear of touching the existing configuration stops many.**

But the real question is: **How do you utilize an existing resource without claiming ownership of its state?**

The answer is simple: **Terraform Data Sources.**

This lesson breaks down the barriers and shows you how to reference pre-existing infrastructure in AWS to maintain clean, decoupled configurations.

---

## 💡 Scenario: The Decoupled Deployment

We are tasked with launching an `aws_instance` into a network (`VPC` and `Subnet`) that was provisioned by a separate process. Our Terraform code must use this network without managing its lifecycle (updates, destruction, etc.).

This keeps our configuration focused, fast, and safe from unintended network changes.

### Pre-existing Infrastructure

The following resources are assumed to exist in your configured AWS region, identified by their specific tags:

* **VPC:** Tag `Name = shared-network-vpc`
* **Subnet:** Tag `Name = shared-primary-subnet` (must be within the VPC above)

---

## 🛠️ The Terraform Solution (`main.tf` Highlights)

We use Data Sources to query AWS for the IDs of these existing resources based on their tags:

### 1. Find the Shared VPC

```hcl
data "aws_vpc" "shared" {
  filter {
    name   = "tag:Name"
    values = ["shared-network-vpc"]
  }
}

2. Find the Primary Subnet within the VPC
data "aws_subnet" "shared" {
  filter {
    name   = "tag:Name"
    values = ["shared-primary-subnet"]
  }
  # Ensures the subnet belongs to the VPC we just found
  vpc_id = data.aws_vpc.shared.id 
}

3. Find the Latest Amazon Linux 2 AMI

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

4. Provision the EC2 Instance

The aws_instance resource then uses the outputs (like .id) from these Data Sources to launch precisely where we need it to be.
resource "aws_instance" "day13_instance" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.shared.id # <- KEY USAGE OF DATA SOURCE
  tags = {
    Name = "day13-instance"
  }
}

🏃 How to Run This Demo
Step 1: Create the Pre-existing Infrastructure (Simulation)

We first run a setup script to simulate the network resources created by another team.

cd lessons/day13/code/setup
terraform init
terraform apply --auto-approve

This creates the shared-network-vpc and shared-primary-subnet)
Step 2: Provision the EC2 Instance using Data Sources

Now, move back and run the main configuration that uses the Data Sources to reference the network.

cd ../.. # Go back to the day13/code directory
terraform init
terraform plan 
# IMPORTANT: The plan should show only the 'aws_instance' being created (1 new resource).
# It should show NO changes to the VPC or Subnet!

terraform apply --auto-approve

ज़रूर, मैं आपके Day 13: Terraform Data Sources with AWS लेसन के लिए उसी मोटिवेशनल और इंगेजिंग स्टाइल में एक README.md फाइल ड्राफ्ट कर देता हूँ।

इसे आप सीधे कॉपी करके अपनी GitHub रिपॉजिटरी में पेस्ट कर सकते हैं।
Markdown

# Day 13: Terraform Data Sources with AWS - Launch Without Ownership

## 🎯 The Challenge: Reference, Not Manage

You want to integrate your new application (an EC2 instance) into an existing, robust network. You know the network is there, managed perfectly by another team (or another configuration).

**The fear of touching the existing configuration stops many.**

But the real question is: **How do you utilize an existing resource without claiming ownership of its state?**

The answer is simple: **Terraform Data Sources.**

This lesson breaks down the barriers and shows you how to reference pre-existing infrastructure in AWS to maintain clean, decoupled configurations.

---

## 💡 Scenario: The Decoupled Deployment

We are tasked with launching an `aws_instance` into a network (`VPC` and `Subnet`) that was provisioned by a separate process. Our Terraform code must use this network without managing its lifecycle (updates, destruction, etc.).

This keeps our configuration focused, fast, and safe from unintended network changes.

### Pre-existing Infrastructure

The following resources are assumed to exist in your configured AWS region, identified by their specific tags:

* **VPC:** Tag `Name = shared-network-vpc`
* **Subnet:** Tag `Name = shared-primary-subnet` (must be within the VPC above)

---

## 🛠️ The Terraform Solution (`main.tf` Highlights)

We use Data Sources to query AWS for the IDs of these existing resources based on their tags:

### 1. Find the Shared VPC

```hcl
data "aws_vpc" "shared" {
  filter {
    name   = "tag:Name"
    values = ["shared-network-vpc"]
  }
}

2. Find the Primary Subnet within the VPC
Terraform

data "aws_subnet" "shared" {
  filter {
    name   = "tag:Name"
    values = ["shared-primary-subnet"]
  }
  # Ensures the subnet belongs to the VPC we just found
  vpc_id = data.aws_vpc.shared.id 
}

3. Find the Latest Amazon Linux 2 AMI
Terraform

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

4. Provision the EC2 Instance

The aws_instance resource then uses the outputs (like .id) from these Data Sources to launch precisely where we need it to be.
Terraform

resource "aws_instance" "day13_instance" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.shared.id # <- KEY USAGE OF DATA SOURCE
  tags = {
    Name = "day13-instance"
  }
}

🏃 How to Run This Demo
Step 1: Create the Pre-existing Infrastructure (Simulation)

We first run a setup script to simulate the network resources created by another team.
Bash

cd lessons/day13/code/setup
terraform init
terraform apply --auto-approve

(This creates the shared-network-vpc and shared-primary-subnet)
Step 2: Provision the EC2 Instance using Data Sources

Now, move back and run the main configuration that uses the Data Sources to reference the network.
Bash

cd ../.. # Go back to the day13/code directory
terraform init
terraform plan 
# IMPORTANT: The plan should show only the 'aws_instance' being created (1 new resource).
# It should show NO changes to the VPC or Subnet!

terraform apply --auto-approve

Step 3: Verification

    Go to the AWS EC2 console.

    Find the instance named day13-instance.

    Check its Networking details—confirm it is successfully deployed into the shared-network-vpc and shared-primary-subnet. Success!

🧹 Cleanup: Leave No Trace

To destroy all resources created in this lesson:
# 1. Destroy the EC2 instance (managed by the main code)
cd lessons/day13/code
terraform destroy --auto-approve

# 2. Destroy the shared VPC and subnet (managed by the setup code)
cd setup
terraform destroy --auto-approve

Don't just manage. Integrate. Master Terraform Data Sources today!