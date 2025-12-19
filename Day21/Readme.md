

## Day 21/30 – Learning AWS with Terraform 🚀

 This day focuses on **AWS Governance**, showing that real cloud maturity is not about launching resources fast, but controlling them securely, compliantly, and at scale.

---

## 🏗️ The Core Idea

Imagine building a skyscraper with premium materials and the fastest workers, but **no blueprints, no safety checks, and no regulations**.

That’s exactly what an AWS environment looks like **without governance**.

In AWS, governance is the **blueprint + inspection + safety code** combined.

---

## 🧩 What I Learned on Day 21

Earlier, I thought cloud skills were mainly about:

* Launching EC2 instances
* Creating S3 buckets
* Scaling infrastructure

Today’s realization was different:

> **Cloud is not just about building resources. It’s about controlling them.**

---

## 🧱 The AWS Governance Stack (Simplified)

### 1️⃣ Foundation – Policies

Policies define **who can do what** in AWS.

* Acts as a rulebook
* Controls permissions
* Prevents accidental security and cost issues

Without strong policies:

* Costs can spike within minutes
* Security risks increase silently

---

### 2️⃣ Guardrails – Governance

Governance is not about blocking developers.

It’s about:

* Keeping teams aligned
* Enforcing standards automatically
* Monitoring compliance continuously

Think of governance as the **CCTV system of your cloud environment**.

---

### 3️⃣ The Enforcer – AWS Config ⭐

AWS Config was the highlight of this learning day.

It works like a **time machine for AWS resources**:

* Tracks every configuration change
* Shows when something broke
* Helps identify how it broke

---

## 🔐 Key AWS Config Rules I Explored

These rules ensure security, compliance, and best practices:

### 1️⃣ S3 Bucket Public Read Prohibited

* Prevents accidental public exposure
* Flags any bucket that becomes public

### 2️⃣ Root Account MFA Enabled

* Adds extra protection to the most powerful account
* Non-negotiable security best practice

### 3️⃣ IAM Password Policy

* Enforces strong password standards
* Prevents weak credentials like `Password123`

### 4️⃣ Encrypted Volumes

* Ensures all data at rest is encrypted
* Protects sensitive information

### 5️⃣ Restricted Common Ports

* Monitors open ports like 22 and 80
* Prevents unnecessary public exposure

### 6️⃣ Instances Launched Inside a VPC

* Ensures all EC2 instances are inside a secure network boundary

---

## 💡 Key Realization

> You don’t just build in the cloud — **you govern it**.

AWS Config doesn’t only tell you:

* *What* is broken

It also tells you:

* *When* it broke
* *How* it broke
* *What needs fixing*

---

## 🎯 Why This Matters (Recruiter View)

This learning shows:

* Cloud security awareness
* Governance-first mindset
* Understanding of compliance and best practices
* Practical exposure to AWS-native tools

These skills are critical for:

* Cloud Engineers
* DevOps Engineers
* Site Reliability Engineers (SRE)

---

## 🏁 Final Thought

Speed is impressive.

**Control is powerful.**

Governance turns fast cloud environments into **safe, scalable, and production-ready systems**.

