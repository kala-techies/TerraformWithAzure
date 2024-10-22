

## Day 04: Azure VM Deployment

  Today we'll walk through deploying a Windows Virtual Machine on Azure using Terraform. We'll cover the essential components required for this deployment and build them step-by-step. Below is the task sequence for creating and managing Azure resources in this process.

### Task Sequence and Action Items

1. **Create Resource Group Manually**:  
   We'll start by creating a resource group manually, which will act as a container for all the resources we'll deploy.

2. **Deploy Virtual Network (VNET) Using Terraform**:  
   A virtual network will be created using Terraform, providing the underlying network for the Azure VM.

3. **Deploy Subnet Using Terraform**:  
   Within the virtual network, we will create a subnet to further segment the network and isolate the VM's network traffic.

4. **Public IP Creation**:  
   A public IP address will be created to allow external access to the VM.

5. **Create Network Security Group (NSG)**:  
   We will create an NSG and attach it to the subnet. This will control inbound and outbound traffic rules. Specifically, we’ll allow RDP access (port 3389) to manage the Windows VM remotely.

6. **Create Network Interface (NIC)**:  
   A NIC will be created to enable communication between the VM. 

7. **VM Deployment**:  
   Finally, a Windows Virtual Machine will be deployed, connecting all the previously created resources.

### Resources to Create

- **Resource Group**: The container for all other resources.
- **Virtual Network (VNET)**: The main network that will host the subnet.
- **Subnet**: A smaller network within the VNET, isolating the VM's network traffic.
- **Public IP**: Required for external access to the VM.
- **Network Interface (NIC)**: Connects the VM to the subnet and allows network communication.
- **Network Security Group (NSG)**: Controls network traffic and enables RDP access.
- **Windows Virtual Machine (VM)**: The final resource to be deployed and configured.

By the end of this session, you’ll have a fully functioning Azure VM deployed and accessible via RDP, created and managed using Terraform.

--- 
