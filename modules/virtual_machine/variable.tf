variable "virtual_machine_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "network_interface_id" {}
variable "vm_size" {}
variable "admin_username" {}
variable "admin_password" {}

variable "storage_os_disk" {
  type = object({
    name              = string
    caching           = string
    create_option     = string
    managed_disk_type = string
  })
}

variable "storage_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "os_profile_linux_config" {
  type = object({
    disable_password_authentication = bool
  })
}

