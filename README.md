Terraform Azure Multi-Module Project
1. Project Overview
Deploys Azure infrastructure using Terraform modules.

Modules included:
1. Resource_group
2. Virtual_network
3. Subnet
4. Network_security_group
5. Public_ip
6. Network_interface
7. Nirtual_machine

Modular design allows reuse across environments.

2. Directory Structure
terraform-azure-multi-module/
│
├── main.tf
├── variables.tf
├── provider.tf
├── terraform.tfvars
├── outputs.tf
├── modules/
│   ├── resource_group/
│   ├── virtual_network/
│   ├── subnet/
│   ├── network_security_group/
│   ├── public_ip/
│   ├── network_interface/
│   └── virtual_machine/

3. Prerequisites
- Terraform >= 1.5
- Azure CLI
- Azure Subscription with Contributor access

4. Terraform Commands
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

# Show specific sensitive output
terraform output vm_admin_password

# Destroy all resources
terraform destroy

5. Outputs
Output Name	Description
vm_public_ip	Public IP of the Linux VM
vm_admin_username	Admin username for VM
vm_admin_password	Admin password for VM (sensitive)

6. Notes & Best Practices

 * Put your secrets, Password and Tokens in <terraform.tfvars>. 

 * .gitignore includes .terraform/, *.tfstate, terraform.tfvars to protect secrets.

 * Use sensitive = true for passwords in outputs.

 * Consider Azure Key Vault for production secrets.

 * Modular design allows deploying multiple environments easily.
