## 🚀 Day 10: Writing Dynamic Terraform with Core Expressions

This guide covers the three essential expressions used to write **DRY (Don't Repeat Yourself)** and highly flexible Terraform configurations.

---

### 💡 Core Expressions for Dynamic Code

Terraform code should be smart and reusable. These expressions help inject logic and iteration directly into your configuration blocks.

| Expression | Goal | Syntax |
| :--- | :--- | :--- |
| **Conditional Expressions** | Dynamic **If/Else** for a single attribute value. | `condition ? true_value : false_value` |
| **Dynamic Blocks** | Generate multiple **nested configuration blocks** from a list/map. | `dynamic "block" { for_each = ... }` |
| **Splat Expressions (\*)** | Collect a **list of a single attribute** from multiple resources. | `resource_type.name[*].attribute` |

---

### 1. **Conditional Expressions (The Inline If/Else)**

This allows you to select one of two values based on a boolean test. It's perfect for setting environment-specific parameters.

**Example: Setting Instance Size**

```terraform
resource "aws_instance" "server" {
  ami           = "ami-0abcdef1234567890"
  # If var.env is "prod", use "t3.medium"; otherwise use "t2.micro"
  instance_type = var.env == "prod" ? "t3.medium" : "t2.micro"
}

2. Dynamic Blocks (The Nested Block Iterator)

Use this to avoid manually defining repetitive configuration blocks, like Security Group rules or Auto Scaling Group tags.

Example: Generating Security Group Rules

# Define your ports in a variable
variable "ingress_ports" {
  type    = list(number)
  default = [22, 80, 443]
}

resource "aws_security_group" "web_sg" {
  name = "web-access-sg"

  # Iterate over the list of ports to create multiple 'ingress' blocks
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

Here is a simpler, cleaner, and fully markdown-formatted README.md file for Day 10, designed to be easily downloadable and read:
Markdown

## 🚀 Day 10: Writing Dynamic Terraform with Core Expressions

This guide covers the three essential expressions used to write **DRY (Don't Repeat Yourself)** and highly flexible Terraform configurations.

---

### 💡 Core Expressions for Dynamic Code

Terraform code should be smart and reusable. These expressions help inject logic and iteration directly into your configuration blocks.

| Expression | Goal | Syntax |
| :--- | :--- | :--- |
| **Conditional Expressions** | Dynamic **If/Else** for a single attribute value. | `condition ? true_value : false_value` |
| **Dynamic Blocks** | Generate multiple **nested configuration blocks** from a list/map. | `dynamic "block" { for_each = ... }` |
| **Splat Expressions (\*)** | Collect a **list of a single attribute** from multiple resources. | `resource_type.name[*].attribute` |

---

### 1. **Conditional Expressions (The Inline If/Else)**

This allows you to select one of two values based on a boolean test. It's perfect for setting environment-specific parameters.

**Example: Setting Instance Size**

```terraform
resource "aws_instance" "server" {
  ami           = "ami-0abcdef1234567890"
  # If var.env is "prod", use "t3.medium"; otherwise use "t2.micro"
  instance_type = var.env == "prod" ? "t3.medium" : "t2.micro"
}

2. Dynamic Blocks (The Nested Block Iterator)

Use this to avoid manually defining repetitive configuration blocks, like Security Group rules or Auto Scaling Group tags.

Example: Generating Security Group Rules
Terraform

# Define your ports in a variable
variable "ingress_ports" {
  type    = list(number)
  default = [22, 80, 443]
}

resource "aws_security_group" "web_sg" {
  name = "web-access-sg"

  # Iterate over the list of ports to create multiple 'ingress' blocks
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

3. Splat Expressions (*) (The Attribute Collector)

When you create multiple resources using the count argument, the Splat operator is the quickest way to get a list of all their attributes (e.g., IDs, IP addresses).

Example: Retrieving All Instance IDs

# Creating 3 instances
resource "aws_instance" "db_server" {
  count         = 3
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
}

output "db_server_ids" {
  description = "List of all Database Instance IDs."
  # The [*] collects the 'id' attribute from all 3 instances
  value       = aws_instance.db_server[*].id
}

🤝 Connect & Feedback

Which of these expressions do you rely on the most? Share your thoughts!

#30DaysOfAWSTerraform #Terraform #DevOps #AWS