# Day 08: Terraform Meta-Arguments - Complete Guide

Welcome to Day 08 of the Terraform AWS Course! This lesson provides comprehensive coverage of all Terraform meta-arguments with simple, practical examples.

### 📚 What You'll Learn

* Understanding all Terraform **meta-arguments**.
* `count`: Create multiple resources with numeric indexing.
* `for_each`: Create multiple resources with maps/sets (preferred in production).
* `depends_on`: Explicitly define resource dependencies.
* `lifecycle`: Control resource creation and destruction behavior (`prevent_destroy`, `ignore_changes`).
* `provider`: Use alternate provider configurations (e.g., multi-region).
* Output transformations with **`for` expressions**.

### 📁 Lesson Structure

```text
day08/
├── provider.tf      # AWS provider configuration
├── variables.tf     # Input variables (list, set, map, object types)
├── local.tf         # Local values and common tags
├── backend.tf       # S3 backend configuration
├── main.tf          # Main resource definitions with count and for_each examples
├── output.tf        # Output values demonstrating for loops
├── task.md          # Hands-on exercises and tasks
└── README.md        # This file (You are here)


🎯 Key Concepts: Meta-Arguments

Meta-arguments are special arguments that can be used with any resource type to change its behavior.
Meta-Argument	Purpose	Key Property
count	Create multiple instances based on a number or list length.	Access using count.index.
for_each	Create multiple instances based on a map or set.	Access using each.key and each.value.
depends_on	Force an explicit creation order between unrelated resources.	Defines an invisible dependency.
lifecycle	Customize creation/destruction behavior.	Controls prevent_destroy, ignore_changes, create_before_destroy.
provider	Select a non-default provider configuration instance.	Enables multi-region or multi-account deploys.

COUNT vs. FOR_EACH: Key Differences

Feature	COUNT	FOR_EACH
Input Type	Number or List	Map or Set (Recommended)
Addressing	Numeric index [0], [1]	Key-based ["bucket-name"]
Stability	Less stable (Index shifts can trigger recreation)	More stable (Addressing is tied to the key/name)
Use Case	Simple, identical resources	Production environments, stable references

#Execution 
Command	Purpose
terraform fmt	Format your code files automatically.
terraform validate	Check configuration syntax and internal consistency.
terraform plan	Review the execution plan before making changes.
terraform apply	Apply the configuration to create resources.
terraform output	View output values defined in output.tf.
terraform destroy	Cleanup all created resources.