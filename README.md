
### Terraform with Azure 

Welcome to **Terraform with Azure** learning series. This repository will guide you step by step, helping you understand Terraform concepts while using the Azure provider.  I will upload code samples to this repository, and contributions are welcome! Feel free to fork and create pull requests. Let's learn together!

---

#### **Day 01: Introduction to Terraform Components & Installation**

- **Core Components of Terraform:**
  - **Providers:** Plugins to interact with various cloud platforms.
  - **Resources:** Infrastructure objects like VMs, VNETs, etc.
  - **Data Sources:** Information about existing resources.
  - **Variables & Parameters:** Input values for configuration.
  - **Functions, Modules, Local Variables:** Advanced features for modular and reusable code.
  - **Statefile:** Tracks the current state of infrastructure.

- **Task:** Install Terraform on your system.
  
---

#### **Day 02: HashiCorp Language & Azure Provider Authentication**

- **Understanding the Files:**
  - `main.tf`, `variable.tf`, `terraform.tfvars`, `terraform.tfstate`, `terraform.tfstate.lock`
  
- **Azure Roles:**
  - Owner, Contributor, Reader
  
- **Authentication Methods with Azure:**
  - Azure CLI (`az login`) - Best practice to avoid exposing credentials.
  - App Registration & Service Principal (Client ID, Client Secret, Tenant ID, Subscription ID).

- **Task:** Create an Azure Resource Group and Virtual Network using the code which is in day02.


---

#### **Day 03: Handling Terraform Data Sources & Imports**

- **Concepts:**
  - Deploy new resources.
  - Handle conflicts when manual resources are created via the Azure portal.
  - Use **`terraform import`** to bring manually created resources into Terraform's state.

- **Task:** Create another subnet manually in Azure, then import it into your Terraform state.

---

#### **Day 04: Azure VM Deployment**

- **Resources to Create:**
  1. Resource Group
  2. Virtual Network (VNET)
  3. Subnet
  4. Public IP
  5. Network Interface (NIC)
  6. Windows Virtual Machine (VM)

- **Task:** Create the above infrastructure using Terraform. Understand `variable.tf` and `terraform.tfvars` files for parameterized configurations.

---

#### **Day 05: Managing Multiple `.tfvars` Files**

- **Terraform Plan with Different Variables:**
  - Use multiple `.tfvars` files to deploy unique VMs.
  
- **Command:**
  ```bash
  terraform plan -var-file="custom.tfvars"
  ```

- **Task:** Deploy resources with multiple `.tfvars` files.

---

#### **Day 06: Using Local Variables & AKS Deployment**


- **Task:** Deploy an AKS cluster 

---

#### **Day 07: Custom VNET for AKS**

- **AKS With it's own network:**  we will ensure it uses a custom VNET.

- **Task:** Modify your AKS configuration to use a custom subnet.

---

---

#### **Day 08: Using Terraform modules**


- **Task:** Deploy identical environments using modules

---

#### **Day 09: Terraform Meta-Arguments**

- **Meta-Arguments:**
  - `depends_on`: Set dependencies between resources.
  - `count`: Create multiple identical resources.
  - `for_each`: Create non-identical resources.
  - `lifecycle`: Customize resource management.

- **Task:** Deploy 3 resource groups using the `count` argument.

---

#### **Day 10: ForEach for Non-Identical Resources**

- **ForEach Example:**
  - Useful for deploying non-identical resources like VMs with different configurations.

- **Task:** Deploy multiple non-identical VMs using the `for_each` argument.

---

### Contributing
If you'd like to contribute:
1. Fork the repo.
2. Create your feature branch (`git checkout -b feature/new-topic`).
3. Commit your changes (`git commit -am 'Added a new learning day'`).
4. Push to the branch (`git push origin feature/new-topic`).
5. Create a new Pull Request.

---
