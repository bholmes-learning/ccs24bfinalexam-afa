resource "azurerm_storage_account" "bhmcitrg01" {
  name                     = "braedenmcitlinuxfnappsa"
  resource_group_name      = azurerm_resource_group.bhmcitrg01.name
  location                 = azurerm_resource_group.bhmcitrg01.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "bhmcitasplinux01" {
  name                = "braedenmcitappserviceplan"
  resource_group_name = azurerm_resource_group.bhmcitrg01.name
  location            = azurerm_resource_group.bhmcitrg01.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_function_app" "bhmcitafalinux01" {
  name                = "braedenmcitfunction"
  resource_group_name = azurerm_resource_group.bhmcitafalinux01.name
  location            = azurerm_resource_group.bhmcitafalinux01.location
}

resource "azurerm_storage_account" "mbraedenmcitsa" {
  name                     = "bhstorageaccount"
  resource_group_name      = azurerm_resource_group.mbraedenmcitsa.name
  location                 = azurerm_resource_group.mbraedenmcitsa.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

  site_config {    
    always_on = true
    application_stack {
      current_stack  = "node"
      node_version = "16-LTS"
  }
}
