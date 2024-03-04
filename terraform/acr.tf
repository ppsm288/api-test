resource "azurerm_container_registry" "terratest" {
  name                     = "terraacr789" 
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  sku                      = "Basic" 
  admin_enabled            = true 
  
}