
### Day 08: Using Terraform Modules

Today, we're focusing on **Terraform modules**—an essential tool for deploying identical configurations across multiple environments. Modules enable reusable, modular code, allowing streamlined, consistent deployments with minimal configuration changes.

### What We’ll Cover

In this session, we’ll explore:
- **Terraform module structure**: How to organize and define configurations in root and environment-specific folders.
- **Best practices** for creating reusable modules to manage identical deployments across environments.
- Deploying a sample app with a service plan using modular configurations.

### Why Modules?

Modules in Terraform make it easy to define infrastructure that can be reused across different environments, such as Dev, UAT, and Prod. This ensures consistency, reduces error-prone manual adjustments, and simplifies adapting configurations to the unique needs of each environment.

### Directory Structure

In this setup, the **root module** contains core configuration files, while environment-specific configurations are organized within distinct folders.

```
root folder:
  - main.tf          # Defines the resource configuration
  - variable.tf      # Specifies the data types and variables

env/                     # Environment-specific configurations
├── dev/                 # Development environment configurations
│   └── dev.tf           # Development-specific resource definitions
├── uat/                 # UAT environment configurations
│   └── uat.tf           # UAT-specific resource definitions
└── prod/                # Production environment configurations
    └── prod.tf          # Production-specific resource definitions
```

### Deployment Example

For this task, we’re deploying a sample **web app** along with its **service plan**. Each environment has a dedicated configuration in its respective folder under `env/`, which simplifies adapting and deploying the application to any environment with environment-specific configurations.

### Key Takeaways

- Modules enhance **code reusability** and **maintainability**.
- A clear folder structure helps manage configurations for **Dev**, **UAT**, and **Prod** environments.
- This approach minimizes manual interventions, simplifies scaling, and aligns with **best practices** for Terraform and infrastructure as code.
