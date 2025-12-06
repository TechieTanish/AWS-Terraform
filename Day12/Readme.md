# 🚀 30 DAYS OF AWS & TERRAFORM: Day 12/30 - Advanced Built-in Functions

## 📝 Project Overview

This repository documents the journey through the **#30daysofAWSTerraform** challenge. Day 12 focuses on expanding knowledge of Terraform's built-in functions, moving beyond simple interpolation to complex data manipulation, validation, and file operations.

This lesson, "AWS Terraform Functions - Part 2," emphasizes writing more resilient, dynamic, and error-proof configurations using advanced function categories.

---

## 🧭 Table of Contents

1.  [Day 12: Core Focus](#1-day-12-core-focus)
2.  [Key Functions & Concepts](#2-key-functions--concepts)
3.  [Assignments and Code Examples](#3-assignments-and-code-examples)
4.  [Prerequisites](#4-prerequisites)
5.  [About the Series](#5-about-the-series)

---

## 1. Day 12: Core Focus

The main objective of today's learning was to understand how to leverage specialized built-in functions to control input data, interact with the local filesystem, and handle collections efficiently.

### 2. Key Functions & Concepts

This session covered the following critical categories and functions:

### ✅ **I. Configuration Validation**
We implemented custom validation blocks to enforce structural and data quality rules on input variables.

| Function/Block | Description | Usage Example |
| :--- | :--- | :--- |
| `validation { ... }` | Custom blocks used within `variable` definitions to define constraints. | Ensures variables meet specific criteria before deployment. |
| `length()` | Used within validation to check the length of strings or collections. | `length(var.instance_type) >= 2` |
| `can()` with `regex()` | Used to check if a regular expression successfully matches a string, returning `true` or `false` without crashing the plan. | `can(regex("^[a-z][0-9]*\\.[a-z0-9]+$", var.instance_type))` |
| `endswith()`, `startswith()` | Checks if a string begins or ends with a specific substring. | Useful for enforcing naming conventions. |
| `sensitive = true` | Flag used to prevent variable values from being shown in console output. | Securing passwords or API keys. |

### 📁 **II. File and Data Handling**
Functions for interacting with the local filesystem and decoding structured data.

* `fileexists()`: Checks if a file exists at a given path.
* `file()`: Reads the contents of a file (used for scripts, policies, etc.).
* `jsondecode()`: Parses a JSON string from a file or variable into a native Terraform data structure (map or list).
* `filepath()`: Gets the absolute path of a local file.

### 🔢 **III. Numeric and Date/Time Operations**
Functions for mathematical calculations and time management.

* `sum()`, `max()`, `min()`: Standard mathematical aggregate functions for collections.
* `timestamp()`: Returns the current UTC timestamp (e.g., used for setting unique resource names or tracking deployments).

### ⚙️ **IV. Collections Review**
Revisiting powerful functions for managing lists and sets.

* `concat()`: Merges multiple lists into a single list.
* `toset()`: Converts a list to a set, automatically removing duplicate values.

---

### How to Run Examples

1.  Navigate to the code directory: `cd day-12-functions-part2`
2.  Initialize the working directory: `terraform init`
3.  Validate the configuration (especially the validation blocks): `terraform validate`
4.  View the execution plan: `terraform plan`


## 3 About the Series

This repository is part of the **#30daysofAWSTerraform** learning challenge led by Piyush Sachdeva.


Resources:

Piyush sachdeva

Youtube :(https://youtu.be/ZYCCu9rZkU8?si=RWWl1QQR5D9THSON)