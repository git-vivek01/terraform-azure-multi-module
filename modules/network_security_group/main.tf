resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = var.security_rules.name
    priority                   = var.security_rules.priority
    direction                  = var.security_rules.direction
    access                     = var.security_rules.access
    protocol                   = var.security_rules.protocol
    source_port_range           = var.security_rules.source_port_range
    destination_port_range      = var.security_rules.destination_port_range
    source_address_prefix       = var.security_rules.source_address_prefix
    destination_address_prefix  = var.security_rules.destination_address_prefix
  }
}
