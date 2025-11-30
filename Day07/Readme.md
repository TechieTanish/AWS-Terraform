# Day 07: Terraform Type Constraints

This module focuses on controlling the types of data used in Terraform variables (inputs).

## 🔑 Key Types Covered

### 1. Basic Types (Simple Values)
* **`string`**: Text (e.g., "prod-server").
* **`number`**: Any number (e.g., 5, 8080).
* **`bool`**: True or False.

### 2. Collection Types (Groups of Data)
* **`list(type)`**: Ordered group (duplicates allowed).
* **`set(type)`**: Unordered group (no duplicates allowed).
* **`map(type)`**: Key-Value pairs (e.g., tags `{Env="Dev"}`).

### 3. Structured Types (Complex Data)
* **`object({...})`**: Fixed structure with named fields (most common for complex configs).
* **`tuple([...])`**: Fixed order with fixed types for each item.

## 🛡️ Validation

We used the **`validation`** block to check inputs against custom rules (e.g., making sure a port is within a safe range, like 1024-65535).

## ✨ Best Practices
1.  **Always specify types.**
2.  **Use `validation`** for important business rules.
3.  Choose `list`, `set`, or `map` carefully based on data needs (order/uniqueness).