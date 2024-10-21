

### Day 02: HashiCorp Language & Azure Provider Authentication

#### Understanding the Files:

- `main.tf`, `variable.tf`, `terraform.tfvars`, `terraform.tfstate`, `terraform.tfstate.lock`

##### - `main.tf`:
The `main.tf` file is the primary file in Terraform, written with the `.tf` extension. This is where you define the provider (e.g., Azure), its version, and specify authentication details. Additionally, it contains the code blocks for the resources you want to create, such as VMs, storage accounts, etc.

Example of a basic `main.tf` setup for Azure:

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}
```

##### - `variable.tf`:
The `variable.tf` file defines all the variables you’ll use in your Terraform code, but it doesn’t contain their actual values. It’s a good practice to define variables and their types here for cleaner, modular code. Although you can set default values, it’s better to avoid them for flexibility.

Example of variable definitions:

```hcl
variable "resource_group_name" {
  type = string
}
```

Common data types used in variables:

1. **String**
2. **Number**
3. **List**
4. **Set**
5. **Map**

##### - `terraform.tfvars`:
This file holds the actual values for the variables defined in `variable.tf`. It allows for easier customization without altering the core `main.tf` file. By separating variable values, even non-developers on your team can modify infrastructure without needing deep Terraform knowledge.

Example `terraform.tfvars` file:

```hcl
resource_group_name = "my-resource-group"
```

This separation enhances collaboration and makes maintaining infrastructure easier, even when you're unavailable. It allows team members to update variable values and deploy resources without extensive Terraform expertise.

---

### Azure Roles:

Before automating infrastructure deployment, it's essential to understand Azure roles and permissions. Here's a simplified breakdown:

1. **Owner**: Full access, including managing users and permissions. They are essentially the administrator of the Azure environment.
2. **Contributor**: Can create and manage resources but cannot assign permissions or create new users.
3. **Reader**: Can view resources but cannot make any changes. This role is often assigned to non-operations teams for monitoring purposes.

---

### Authentication Methods with Azure:

There are multiple ways to authenticate Terraform with Azure. For local development, one of the simplest methods is using the Azure CLI:

1. **Azure CLI (`az login`)**:
   - After navigating to your project directory, run `az login` in your terminal.
   - A browser window will open where you can log in with your Azure credentials.
   - This method is commonly used for local development but not preferred in production environments.

2. **App Registration & Service Principal**:
   - In production or CI/CD pipelines, it’s better to authenticate using a Service Principal (App Registration).
   - You’ll need the **Client ID**, **Client Secret**, **Tenant ID**, and **Subscription ID**.
   - This is a more secure method, avoiding direct exposure of credentials.

> Make sure to install the Azure CLI from the [Microsoft website](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) before proceeding with authentication.

---

