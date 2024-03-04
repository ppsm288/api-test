resource "azurerm_kubernetes_cluster" "test" {
  name                = "terracluster" 
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  dns_prefix          = "mydns" 

  default_node_pool {
    name            = "myterra"
    node_count      = 1
    vm_size         = "Standard_DS2_v2" 
  }

service_principal {
    client_id     = "aaad61ea-38ac-4ff2-b0f0-648cff1c50e6"
    client_secret = "RuE8Q~EbwIW2LfZlW1ZYxNT~Po92.YVVoUAhUb47"
  }
}