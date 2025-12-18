# Terraform Custom Modules for Amazon EKS 🚀

## 📌 Overview

Hardcoding infrastructure does not scale. As environments grow, **reusability, consistency, and governance** become non-negotiable. On **Day 20 of my Terraform learning journey**, I explored how **custom Terraform modules** transform raw infrastructure code into **production-ready, scalable building blocks** for Amazon EKS.

This README gives a **clear, beginner-friendly overview** of why and how custom modules are used for EKS.

---

## 🧩 What Are Terraform Custom Modules?

A Terraform module is a **self-contained package of Terraform configuration files** that encapsulates:

* Resources
* Variables
* Outputs

Custom modules allow you to define infrastructure **once** and reuse it across multiple environments like dev, staging, and production.

---

## ☸️ Why Use Custom Modules for EKS?

Amazon EKS setups can quickly become complex, involving networking, IAM, node groups, security rules, and add-ons. Custom modules help tame this complexity.

### ✅ Key Benefits

* **DRY Principle**
  Write once, reuse everywhere. No copy-paste chaos.

* **Governance & Security**
  Enforce standard IAM roles, networking rules, and security policies across all clusters.

* **Efficiency & Speed**
  Launch a fully compliant EKS cluster in minutes instead of hours.

* **Scalability**
  Manage 2 clusters or 200 using the same trusted blueprint.

---

## 🏗️ Typical EKS Module Structure

```
modules/
└── eks/
    ├── main.tf        # Core EKS resources
    ├── variables.tf   # Inputs (cluster name, region, node size)
    ├── outputs.tf     # Outputs (cluster endpoint, kubeconfig)
```

This structure keeps the logic clean, readable, and reusable.

---

## 🔁 How It’s Used

Once the module is created, it can be called from any environment:

* Dev
* Staging
* Production

Each environment passes its own variables while using the **same module logic**.

---

## 🧠 Key Learning Outcome

Custom Terraform modules are the **bridge between a Cloud Engineer and a Platform Architect**. They shift the focus from writing infrastructure to **designing scalable platforms**.

If Infrastructure as Code is the engine, **modules are the blueprint**.

---

## 🛠️ Tools & Concepts Covered

* Terraform Modules
* Amazon EKS
* Reusability & Abstraction
* Infrastructure as Code (IaC)
* Platform Engineering Mindset

---

## 🚀 Final Thought

Modularization is not an optimization  it’s a **necessity** in modern DevOps. If you want scalable, secure, and sane infrastructure, **stop hardcoding and start modularizing**.

---

