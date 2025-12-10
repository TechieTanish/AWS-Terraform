# ☁️ Day 16: Automated AWS IAM User Management (Terraform)

> **"Friends don't let friends click in the AWS Console manually."**

### 🚀 Overview
Welcome to **Day 16** of my DevOps journey! This project demonstrates the power of **Infrastructure as Code (IaC)** by automating the tedious task of user onboarding.

Instead of manually creating users one by one in the AWS Console, this Terraform project reads a simple CSV file (like an HR roster) and automatically provisions **IAM Users**, **Groups**, and **Policies**. It creates a scalable "Identity Factory" that can handle 10 users or 10,000 users with the same effort.

---

### 🏢 The Scenario: "Dunder Mifflin" Goes to Cloud
Imagine you are the IT Admin for *Dunder Mifflin*. HR sends you an Excel sheet with **26 new employees** (Michael Scott, Dwight Schrute, Jim Halpert, etc.).

**The Old Way:**
1. Log in to AWS Console.
2. Click "Create User" -> Type "Michael" -> Click Next -> Select Group...
3. Repeat 25 more times. 😫

**The Terraform Way:**
1. Drop the `users.csv` file into the folder.
2. Run `terraform apply`.
3. **Done.** 26 Users created, tagged, and assigned to groups in seconds. ⚡

---

### 🛠️ Architecture & Workflow

```mermaid
graph LR
    A[HR Roster CSV] -->|csvdecode| B(Terraform Logic)
    B -->|for_each loop| C[Create IAM Users]
    B -->|Dynamic Filtering| D[Create IAM Groups]
    C -->|Assign| E[Group Memberships]
    
    style B fill:#f9f,stroke:#333,stroke-width:2px


🛡️ Security Best Practices

    State Management: The terraform.tfstate is stored in an S3 Bucket (Remote Backend) to prevent data loss and support team collaboration.

    Password Policy: All created users have password_reset_required = true, forcing them to change their password on first login.

    Least Privilege: Users are assigned to groups, and policies should be attached to Groups, not Users.

📝 Learnings from Day 16

    Automation > Manual Work: I learned how to save hours of manual clicking.

    Data-Driven Infrastructure: Using a CSV file as a data source is a game-changer for bulk operations.

    Terraform Functions: Mastered csvdecode, substr, lower, and for loops.

🤝 Connect

If you found this helpful or have questions about Terraform loops, feel free to reach out!
#DevOps #Terraform #AWS #InfrastructureAsCode #Learning