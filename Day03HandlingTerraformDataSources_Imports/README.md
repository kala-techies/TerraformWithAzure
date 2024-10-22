

### Day 03: Managing Terraform Data Sources & Imports

#### Understanding Terraform File Structure
Before working with data sources and imports, it's important to know the key Terraform files:

1. **`main.tf`**: Defines your resources and providers.
2. **`variables.tf`**: Declares input variables for reusability and flexibility.
3. **`terraform.tfvars`**: Supplies the actual values for variables.

This file structure ensures you have a clear separation between configurations, variable definitions, and their actual values.

---

### Key Concepts

1. **Deploying New Resources**:
   - Terraform simplifies resource provisioning, such as virtual networks, subnets, and storage accounts, etc..
   - To avoid duplication or configuration drift, always check if manually created resources (e.g., via Azure Portal) overlap with Terraform-managed resources.

2. **Dealing with Manually Created Resources**:
   - Resources created outside Terraform (manually via Azure Portal, for example) are not tracked by Terraform.
   - To manage these resources within Terraform, you need to either import them into Terraform’s state or reference them using **data sources**.

3. **Using `terraform import`**:
   - The `terraform import` command integrates manually created resources into Terraform’s state file.
   - After importing, Terraform tracks these resources just like those it created, allowing you to manage them programmatically.

---

### Task: Create and Import a Subnet

#### 1. Create a Subnet Manually:
   - In Azure Portal, create a subnet within an existing virtual network.

#### 2. Import the Subnet into Terraform:
   - Use `terraform import` to bring the manually created subnet into Terraform’s state:

   ```bash
   terraform import azurerm_subnet.example_subnet /subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP_NAME>/providers/Microsoft.Network/virtualNetworks/<VNET_NAME>/subnets/<SUBNET_NAME>
   ```

This command imports the manually created subnet so Terraform can manage it.

---

### Data Sources: Referencing Existing Resources

#### Why Use Data Sources?
- Data sources let you reference existing infrastructure without bringing it under Terraform’s control.
- This is useful when migrating from manually managed resources to Infrastructure as Code (IaC) without introducing drift.

#### Example: Using a Data Source to Reference an Existing Virtual Network
If you need to create subnets in a virtual network that was manually created, you can reference the existing virtual network using a data source:

```hcl
data "azurerm_virtual_network" "existing_vnet" {
  name                = "my-existing-vnet"
  resource_group_name = "my-resource-group"
}

resource "azurerm_subnet" "example_subnet" {
  name                 = "example-subnet"
  resource_group_name  = "my-resource-group"
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
```

In this example, Terraform references the existing virtual network, preventing any need for re-creation.

---

### Import vs. Data Sources

- **Data Sources**: Reference existing resources without managing them. Ideal for referencing external infrastructure without modifying it.
- **`terraform import`**: Imports resources into Terraform’s state, giving Terraform full control over the resources going forward.

#### Example of Importing a Virtual Network:
To manage a manually created virtual network in Terraform, write the configuration first:

```hcl
resource "azurerm_virtual_network" "example_vnet" {
  name                = "my-existing-vnet"
  resource_group_name = "my-resource-group"
  address_space       = ["10.0.0.0/16"]
}
```

Then use the import command:

```bash
terraform import azurerm_virtual_network.example_vnet /subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP_NAME>/providers/Microsoft.Network/virtualNetworks/<VNET_NAME>
```

---

### Why Import?

- Use `terraform import` to bring existing infrastructure under Terraform management, particularly when transitioning from a manually managed environment to IaC.

---




