resource "azurerm_resource_group" "dev_rg" {
    name = var.resource_group_name
    location = var.location
  
}

resource "azurerm_virtual_network" "dev_vnet" {
    name = "dev_vnet"
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.dev_rg.location
    resource_group_name = azurerm_resource_group.dev_rg.name
  
}

resource "azurerm_subnet" "dev_subnet" {
    name = "dev_subnet"
    resource_group_name = azurerm_resource_group.dev_rg.name
    virtual_network_name = azurerm_virtual_network.dev_vnet.name
    address_prefixes = ["10.0.1.0/24"]

  
}

resource "azurerm_network_security_group" "dev_nsg" {
    name = "dev_nsg"
    location = azurerm_resource_group.dev_rg.location
    resource_group_name = azurerm_resource_group.dev_rg.name
  
}

resource "azurerm_subnet_network_security_group_association" "dev_nsg_assoc" {
  subnet_id                 = azurerm_subnet.dev_subnet.id
  network_security_group_id = azurerm_network_security_group.dev_nsg.id
}