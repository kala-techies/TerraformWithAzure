

### Day 06: Using Local Variables & AKS Deployment

---

#### Overview:

On **Day 06**, we will explore the importance of **local variables** in Terraform and how they can improve code readability and maintainability. Additionally, we will deploy an **Azure Kubernetes Service (AKS)** cluster using Terraform.

---

### Sequence of Study:

1. **Understanding Local Variables in Terraform**
2. **AKS Deployment with Default Configuration**

---

### 1. **Local Variables in Terraform:**

Local variables are a powerful feature in Terraform that helps to clean up your code by simplifying how values are referenced across your configuration files. They allow you to assign a label or a shorthand name to a value, reducing repetition and improving the readability of your code.

#### Why Use Local Variables?

- **Simplify Complex Values**: If you have long resource names, or frequently repeated values, using local variables can help simplify how these values are used across your configuration.
- **Improve Code Readability**: Instead of hardcoding long names or paths multiple times in your configuration, you can assign them to a local variable and reference the variable, making your code cleaner and easier to maintain.
- **Enhance Reusability**: By using local variables, you can make your configuration more modular and easier to adjust for different environments.

---

#### Example Scenario:

Let’s assume you're working with resource group names or components with long and complex names. Instead of repeating these long names throughout your code, you can use local variables to keep the code neat and follow best practices for coding standards.

---

#### Example - Local Variables in Action:

In a typical Terraform setup, you might define your resource configurations in `main.tf`, variable definitions in `variable.tf`, and the values in `terraform.tfvars`. By introducing **local variables**, you can make this process more efficient.

- **Without Local Variables:**
    ```hcl
    resource "azurerm_resource_group" "rg" {
      name     = "my-app-production-resource-group-westus"
      location = "West US"
    }
    ```

- **With Local Variables:**
    ```hcl
    locals {
      rg_name = "my-app-production-resource-group-westus"
    }

    resource "azurerm_resource_group" "rg" {
      name     = local.rg_name
      location = "West US"
    }
    ```

In the above example, the local variable `rg_name` holds the long resource group name, which makes the code cleaner and easier to maintain. You can also reuse `local.rg_name` in multiple places without typing the full name each time.

---

### 2. **Azure Kubernetes Service (AKS) Deployment:**

After understanding the use of local variables, we will move on to deploying an **Azure Kubernetes Service (AKS)** cluster with a default configuration using Terraform.

AKS is a managed Kubernetes service by Azure, allowing you to quickly deploy, manage, and scale containerized applications using Kubernetes.

---

#### AKS Deployment Steps:

1. **Define the AKS Configuration**: In `main.tf`, specify the configuration for the AKS cluster.
2. **Use Local Variables**: To simplify the deployment, you can utilize local variables for commonly used values such as resource group name, cluster name, or node count.
3. **Apply the Configuration**: Use the Terraform commands to deploy the AKS cluster.

---

#### Example - AKS Deployment with Local Variables:

```hcl
locals {
  aks_cluster_name  = "my-aks-cluster"
  resource_group    = "my-aks-resource-group"
  location          = "East US"
  node_count        = 2
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.aks_cluster_name
  location            = local.location
  resource_group_name = local.resource_group

  default_node_pool {
    name       = "agentpool"
    node_count = local.node_count
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
```

In this example:
- We’ve used **local variables** for the AKS cluster name, resource group, location, and node count.
- This makes the configuration more modular and easier to modify if any changes are required in the future.

---

### Conclusion:

Using **local variables** in Terraform helps to simplify and clean up your code, making it more readable and maintainable. This is especially helpful when working with complex configurations like deploying an **AKS** cluster.

By the end of **Day 06**, you will have a solid understanding of:
- How to use local variables effectively in your Terraform configuration.
- How to deploy an AKS cluster using Terraform with default settings.

