

### Day 05: Managing Multiple `.tfvars` Files

#### Terraform Plan with Different Variables:

In this section, we will explore how to use multiple `.tfvars` files to deploy unique Virtual Machines (VMs) or resources with different configurations.

---

#### Objective:

The goal of Day 5 is to understand the usage of `.tfvars` files in Terraform and how they simplify the process of deploying infrastructure with varying configurations without altering the core Terraform configuration files.

---

### Scenario:

Let’s assume you’ve been tasked with helping the development or database team provision servers, storage accounts, or other infrastructure resources for their daily needs. Instead of writing the same Terraform configurations repeatedly for each unique request, you can leverage `.tfvars` files to customize specific values while keeping the core configuration unchanged.

### Approach:

To simplify the process, we will:

- Create a standard **`main.tf`**, **`variable.tf`**, and **`example.tfvars`** file.
- Teams will only need to make minimal changes to the `.tfvars` files, such as specifying the **name** of the server or **storage account**, without touching the core configuration.
- The same configuration files will remain consistent across different environments or use cases.

### Benefits:

- **Efficiency**: By using `.tfvars` files, you can save time and effort when deploying similar infrastructure for different teams or purposes.
- **Consistency**: The configuration stays the same across environments, reducing the likelihood of human error.
- **Flexibility**: Teams only need to adjust minimal parameters in the `.tfvars` files, making it easier to manage varying deployments.

---

### Example:

#### File Structure:

1. **`main.tf`**: Contains the core resource configurations for deploying a VM, storage account, or other Azure resources.
2. **`variable.tf`**: Defines the input variables that will be populated from the `.tfvars` file.
3. **`example.tfvars`**: Holds the variable values for a specific deployment (e.g., the name of the VM or storage account).

#### Example `.tfvars` File:

```hcl
# example.tfvars
vm_name          = "dev-server-01"
storage_account  = "devstorageaccount01"
location         = "East US"
```

In this scenario, teams will only need to modify the `.tfvars` file to change the resource names or locations while leaving the core configurations in `main.tf` untouched.

---

### Notes:

- The examples provided here are meant to help people understand Terraform's basic usage. In this exercise, we are not focusing on advanced practices such as modularization or workspaces.
- The intent is to make sure users understand how to use **different `.tfvars` files** to deploy infrastructure with varying configurations.

---

### Running Terraform with Different `.tfvars` Files:

To apply Terraform configurations with different `.tfvars` files, you can use the following command:

```bash
terraform plan -var-file="example.tfvars"
```

You can create multiple `.tfvars` files for different environments or use cases (e.g., `dev.tfvars`, `prod.tfvars`, etc.), and specify the file you want to use during each Terraform plan or apply:

```bash
terraform apply -var-file="dev.tfvars"
terraform apply -var-file="prod.tfvars"
```

This allows you to reuse the same Terraform configurations while deploying unique resources with minimal changes.

---

By leveraging multiple `.tfvars` files, you can streamline the infrastructure provisioning process for teams and provide a flexible, consistent way of managing different environments or needs without duplicating configurations.

---
