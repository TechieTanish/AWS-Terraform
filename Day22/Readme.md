🔐 Day 22: Secure 2-Tier Architecture with Automated Secrets (Terraform)

“Hardcoding passwords is not convenience. It’s a vulnerability.”


>This project focuses on designing and automating a secure, production-style 2-Tier Architecture on AWS using Terraform, where database credentials are never exposed, hardcoded, or manually handled.

The goal was not just to provision resources, but to think like a Cloud Engineer who designs for security, scalability, and repeatability from day one.

🧠 Architecture Overview (High-Level Concept)

A Two-Tier Architecture separates responsibilities clearly:

Web Tier handles public traffic and user interaction

Database Tier stores data privately and securely

This separation reduces attack surface and enforces strict access control.

🏗️ Logical Architecture Breakdown
🌐 Web Tier (Public Zone)

Lives inside a Public Subnet

Accepts incoming HTTP traffic (Port 80)

Acts as the only entry point to the application

Communicates with the database securely

🗄️ Database Tier (Private Zone)

Lives inside a Private Subnet

Completely isolated from the public internet

Only accessible from the Web Tier

Hosts AWS RDS MySQL

🔐 Secrets Layer (AWS Secrets Manager)

Automatically generates database credentials

No passwords stored in Terraform files or variables

Credentials injected securely into RDS

🧱 What I Implemented (Using Terraform)
1️⃣ VPC & Networking Foundation

I created a strong networking base that defines clear boundaries.

Custom VPC

Public and Private Subnets

Internet Gateway for public access

Routing configured to ensure:

Web Tier is reachable

Database Tier remains isolated

This ensures traffic flows only where it is explicitly allowed.

2️⃣ Security Groups (Layered Defense)

Security Groups were designed with least privilege in mind.

Web Security Group

Allows inbound HTTP (Port 80) from the internet

Database Security Group

Allows inbound MySQL (Port 3306)

Only from Web Tier Security Group

No public access

This enforces identity-based access instead of IP-based trust.

3️⃣ AWS RDS (MySQL in Private Subnet)

Fully managed RDS MySQL

Deployed inside Private Subnets

No public endpoint

Integrated with Secrets Manager for credentials

This setup reflects real-world enterprise database placement.

4️⃣ Secrets Management (No More Hardcoding 🔥)

One of the most important learnings of this day.

Used aws_secretsmanager_secret

Used aws_secretsmanager_secret_version

Passwords are:

Auto-generated

Securely stored

Never visible in Terraform state or code

Even developers don’t “know” the password. The system does.

5️⃣ Terraform Modules & Output Passing

To keep the project clean, scalable, and reusable, I used modules.

VPC Module exports:

VPC ID

Subnet IDs

RDS Module consumes:

Private Subnet IDs

Security Group IDs

Secrets Module exports:

Secret ARN

This taught me how real Terraform projects are structured in production.

🔁 Why This Architecture Matters

✅ Secure by Default
✅ No Hardcoded Credentials
✅ Repeatable Infrastructure
✅ Scalable Design
✅ Recruiter-Grade Best Practices

Automating this stack ensures:

No manual mistakes

No leaked secrets

Easy redeployment across environments

📌 Key Learnings from Day 22

Security is an architecture decision, not a patch

Secrets Manager is essential for production workloads

Terraform modules make infrastructure readable and maintainable

Private subnets are non-negotiable for databases

Passing outputs between modules is a core IaC skill

🚀 Tools & Services Used

Terraform

AWS VPC

AWS RDS (MySQL)

AWS Secrets Manager

Security Groups

Modular Infrastructure Design

🙏 Acknowledgement

Special thanks to Piyush Sachdeva for the #30DaysOfTerraform challenge, which continuously pushes me to think beyond tutorials and towards real-world cloud engineering practices.

📂 Repository Purpose

This repository is part of my Terraform learning journey, focused on:

Cloud security fundamentals

Production-ready infrastructure

Clean, modular Terraform design