resource "azurerm_resource_group" "bhmcitrg01" {
  name     = "mcit_resource_group_bh01"
  location = "canadacentral"
}

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
  resource_group_name = azurerm_resource_group.bhmcitrg01.name
  location            = azurerm_resource_group.bhmcitrg01.location
}

resource "azurerm_storage_account" "mbraedenmcitsa" {
  name                     = "bhstorageaccount"
  resource_group_name      = azurerm_resource_group.mcitbhrg01.name
  location                 = azurerm_resource_group.mcitbhrg01.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
