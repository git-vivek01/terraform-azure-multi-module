# Terraform Azure Multi-Module Project

## Overview

This project deploys Azure infrastructure using Terraform with a modular design. It provisions Resource Groups, Virtual Network, Subnets, Network Security Groups, Network Interfaces, Public IPs, and Linux Virtual Machines. Modules are reusable for multiple environments.Terraform state File can be optionally stored remotely in an Azure Storage Account Blob Container for collaboration and security.

## Directory Structure

```plaintext
terraform-azure-multi-module/
├── main.tf
├── variables.tf
├── provider.tf
├── terraform.tfvars
├── outputs.tf
└── modules/
    ├── resource_group/
    ├── virtual_network/
    ├── subnet/
    ├── network_security_group/
    ├── public_ip/
    ├── network_interface/
    └── virtual_machine/
```

## Prerequisites

* Terraform >= 1.5
* Azure CLI
* Azure Subscription with Contributor access
* Optional: SSH key for Linux VM access
* Optional: Azure Storage Account and Blob Container for remote Terraform state storage

## Terraform Commands

```bash
# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Plan deployment
terraform plan

# Apply deployment
terraform apply

# Show outputs
terraform output

# Show sensitive output
terraform output vm_admin_password

# Destroy all resources
terraform destroy
```

## Outputs

| Output Name         | Description                       |
| ------------------- | --------------------------------- |
| `vm_public_ip`      | Public IP of the Linux VM         |
| `vm_admin_username` | Admin username for VM             |
| `vm_admin_password` | Admin password for VM (sensitive) |

## Notes & Best Practices

* `.gitignore` should include `.terraform/`, `*.tfstate`, and `terraform.tfvars` to protect secrets.
* Use `sensitive = true` for passwords and secrets in outputs.
* Consider Azure Key Vault for production secret management.
* Modular design allows easy deployment of multiple environments.
