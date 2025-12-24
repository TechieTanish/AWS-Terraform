# 🚀 Day 24 – Building a Production-Grade High Availability Architecture on AWS

This project focuses on designing and understanding a **real-world, production-grade cloud architecture** using AWS and Terraform. 
The goal is to ensure **high availability, scalability, security, and cost awareness**, just like systems used in real companies.

---

## 🏗️ Project Overview

In this setup, we deploy a **highly available web application** using:

* Multiple Availability Zones
* Auto Scaling EC2 instances
* Application Load Balancer
* Secure networking with VPC, public & private subnets
* Infrastructure as Code using Terraform
* Dockerized application deployment

The architecture is designed so that **even if one server or one Availability Zone fails, the application keeps running**.

---

## 🌍 Core Architecture Concepts (Simple Explanation)

### 1️⃣ High Availability (HA)

High Availability means **your application should never go down**.

* The app runs in **multiple Availability Zones**
* If one zone fails, traffic is automatically routed to healthy servers in another zone

👉 Result: No single point of failure

---

### 2️⃣ Scalability (Auto Scaling)

Scalability allows the system to **automatically adjust resources based on traffic**.

* High traffic → New EC2 instances are added
* Low traffic → Extra EC2 instances are removed

This is handled automatically using **Auto Scaling Groups (ASG)**.

---

### 3️⃣ VPC (Virtual Private Cloud)

A VPC is your **private network inside AWS**.

* Full control over IP ranges
* Better security and isolation

#### 🔹 Public Subnet

* Hosts internet-facing components
* Example: Application Load Balancer

#### 🔹 Private Subnet

* Hosts backend servers (EC2 instances)
* Not directly accessible from the internet

👉 This separation improves security

---

### 4️⃣ Application Load Balancer (ALB)

ALB works like a **traffic controller**:

* Receives all incoming user requests
* Distributes traffic evenly across healthy EC2 instances
* Performs health checks continuously

👉 Ensures smooth traffic flow and fault tolerance

---

### 5️⃣ Auto Scaling Group (ASG)

ASG manages the **number of EC2 instances automatically**.

#### 🔹 Scale Out

* Adds new EC2 instances when load increases

#### 🔹 Scale In

* Removes unnecessary EC2 instances when load decreases

You can define limits, for example:

* Minimum: 1 instance
* Maximum: 5 instances

---

### 6️⃣ NAT Gateway

Since EC2 instances are in **private subnets**, they cannot access the internet directly.

NAT Gateway allows:

* Private EC2 → Internet access (for updates, Docker images)
* Internet → Private EC2 ❌ (blocked)

👉 One-way internet access for security

---

### 7️⃣ Infrastructure as Code (Terraform)

Terraform allows you to **define your entire infrastructure using code**.

Instead of clicking in the AWS Console:

* You write `.tf` files
* One command creates everything
* Another command destroys everything

Benefits:

* Reproducible
* Version controlled
* Less human error

---

### 8️⃣ Docker & User Data

* The application runs inside a **Docker container**
* EC2 User Data script automatically:

  * Installs Docker
  * Pulls the application image
  * Runs the container at launch

👉 Every new server is ready without manual work

---

## 🔐 Security Best Practices

* EC2 instances are placed in **private subnets**
* Traffic is allowed **only through the Load Balancer**
* Security Groups control inbound & outbound rules
* SSH access should be restricted to **your own IP only**

---

## ❤️ Health Checks & Self-Healing

* ALB continuously checks EC2 instance health
* If an instance becomes unhealthy:

  * ALB stops sending traffic
  * ASG terminates it
  * A new healthy instance is launched automatically

👉 The system heals itself

---

## 💰 Cost Management (Very Important)

Some AWS resources are **charged hourly**, such as:

* Application Load Balancer
* NAT Gateway

⚠️ After testing, always run:

```
terraform destroy
```

This avoids unnecessary billing and helps control costs.

---

## 🧪 How to Test the Setup

1. Deploy infrastructure using Terraform
2. Copy the **Load Balancer DNS URL**
3. Open it in your browser
4. Stop one EC2 instance manually
5. Observe:

   * Website remains available
   * ASG launches a new instance automatically

---

## 🎯 Key Learnings from Day 24

* How real production systems are designed
* Importance of High Availability & Auto Scaling
* Secure architecture using private subnets
* Power of Infrastructure as Code
* How AWS services work together as a system

---

## 📌 Final Note

This project represents **industry-level cloud architecture thinking**.
Understanding and building such systems is a major step toward becoming a **cloud / DevOps engineer**.

Consistency + hands-on practice = real growth ☁️🚀
