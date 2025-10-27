variable "subscription_id" {}
variable "client_id" {}
# Sensitive variable for client secret
variable "client_secret" {
    sensitive = true
}
variable "tenant_id" {}

variable "location" {
    description = "The Azure region to deploy resources"
    type = string
    default = "Central India"
  
}

variable "resource_group_name" {
  default = "terraform_RG"
}

variable "virtual_network_name" {
  default = "terraform_VNet"
}

variable "subnet_name" {
  default = "terraform_Subnet"
}

variable "network_security_group_name" {
  default = "terraform_NSG"
}

variable "network_interface_name" {
  default = "terraform_NIC"
}

variable "public_ip_name" {
  default = "terraform_PublicIP"
}

variable "virtual_machine_name" {
  default = "terraform-VM"
}

variable "virtual_machine_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  description = "Password for VM"
  sensitive   = true
}

