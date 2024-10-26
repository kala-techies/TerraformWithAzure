

# Day 07: Custom VNET for AKS

This session focuses on deploying an Azure Kubernetes Service (AKS) cluster within a custom Virtual Network (VNET) and setting up an Azure Container Registry (ACR) for image storage. We will configure the cluster to securely pull images from ACR using a managed identity and apply network policies using Calico.

## Objectives

- Deploy AKS within a custom VNET for enhanced network control and isolation.
- Integrate ACR with AKS, enabling AKS to securely pull container images.
- Use the Azure Container Networking Interface (CNI) plugin to manage AKS networking.
- Implement network policies using Calico to control traffic flow within the cluster.
  
## Configuration Overview

1. **Resource Group**: Start by creating a resource group to organize all resources related to this deployment.

2. **Custom Virtual Network (VNET)**: Configure a custom VNET and subnet to provide isolated network space for the AKS cluster. This setup allows you to control network traffic and enhance security.

3. **Azure Container Registry (ACR)**: Create an ACR instance to store container images. Assign a system-assigned managed identity to the AKS cluster, allowing it to securely pull images from ACR.

4. **AKS Cluster**: Deploy AKS with the following configurations:
   - **Network Plugin**: Use Azure CNI to assign IPs directly from the custom VNET, allowing for improved network management.
   - **Network Policies**: Use Calico to implement network policies, controlling traffic flow and enhancing security within the cluster.

---

This setup will enable a secure and efficient AKS deployment within a custom network environment, with image management through ACR and network policies through Calico. 