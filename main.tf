module "resource_group" {
  source            = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location          = var.location
  
}

module "virtual_network" {
    source               = "./modules/virtual_network"
    virtual_network_name = var.virtual_network_name
    address_space        = ["10.0.0.0/16"]
    location             = var.location
    resource_group_name  = module.resource_group.resource_group_name
  
}
module "subnet" {
    source              = "./modules/subnet"
    subnet_name         = var.subnet_name
    resource_group_name = module.resource_group.resource_group_name
    virtual_network_name = module.virtual_network.virtual_network_name
    address_prefixes    = ["10.0.1.0/24"]
    depends_on          = [module.virtual_network]
}
module "network_security_group" {
    source                    = "./modules/network_security_group"
    network_security_group_name = var.network_security_group_name
    resource_group_name       = module.resource_group.resource_group_name
    location                  = var.location
    security_rules = {
            name = "Allow-ssh"
            priority = 1001
            direction = "Inbound"
            access = "Allow"
            protocol = "Tcp"
            source_port_range = "*"
            destination_port_range = "22"
            source_address_prefix = "*"
            destination_address_prefix = "*"
        }
    
}
module "public_ip" {
    source            = "./modules/public_ip"
    public_ip_name    = var.public_ip_name
    resource_group_name = module.resource_group.resource_group_name
    location          = var.location
    allocation_method = "Static"
    sku               = "Standard"
}
module "network_interface" {
  source                      = "./modules/network_interface"
  network_interface_name      = var.network_interface_name
  resource_group_name         = module.resource_group.resource_group_name
  location                     = var.location
  subnet_id                   = module.subnet.subnet_id
  public_ip_id                = module.public_ip.public_ip_id
  network_security_group_id   = module.network_security_group.network_security_group_id
  private_ip_address_allocation = "Dynamic"
  depends_on                  = [module.subnet, module.public_ip, module.network_security_group]

}

module "virtual_machine" {
    source               = "./modules/virtual_machine"
    virtual_machine_name = var.virtual_machine_name
    resource_group_name  = module.resource_group.resource_group_name
    location             = var.location
    network_interface_id = module.network_interface.network_interface_id
    vm_size              = var.virtual_machine_size
    admin_username       = var.admin_username
    admin_password       = var.admin_password
    depends_on           = [module.network_interface]
    storage_os_disk = {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }
    storage_image_reference = {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }
    os_profile_linux_config = {
        disable_password_authentication = false
    }
}