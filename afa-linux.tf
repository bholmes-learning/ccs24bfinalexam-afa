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
  name                = "braedenmcitlinuxfunction"
  resource_group_name = azurerm_resource_group.bhmcitrg01.name
  location            = azurerm_resource_group.bhmcitrg01.location

  storage_account_name       = azurerm_storage_account.bhmcitrg01.name
  storage_account_access_key = azurerm_storage_account.bhmcitrg01.primary_access_key
  service_plan_id            = azurerm_service_plan.bhmcitasplinux01.id

  site_config {}
}


