output "vm_public_ip" {
  description = "The public IP of the VM"
  value       = module.public_ip.public_ip_address  # or module.network_interface.public_ip if you output it from there
}

output "vm_admin_username" {
  description = "The admin username of the VM"
  value       = var.admin_username
}

output "vm_admin_password" {
  description = "The admin password of the VM"
  value       = var.admin_password
  sensitive   = true   # prevents Terraform from printing in plain text unless you force it
}
