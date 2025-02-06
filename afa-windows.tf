resource "azurerm_resource_group" "bhmcitrg02" {
  name     = "mcit_resource_group_bh02"
  location = "canadacentral"
}

resource "azurerm_storage_account" "bhmcitsa02" {
  name                     = "braedenmcitwinfnappsa"
  resource_group_name      = azurerm_resource_group.bhmcitrg02.name
  location                 = azurerm_resource_group.bhmcitrg02.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "bhmcitaspwin01" {
  name                = "braedenmcitasp02"
  resource_group_name = azurerm_resource_group.bhmcitrg02.name
  location            = azurerm_resource_group.bhmcitrg02.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "bhmcitafawin01" {
  name                = "braedenmcitwinfunction"
  resource_group_name = azurerm_resource_group.bhmcitrg02.name
  location            = azurerm_resource_group.bhmcitrg02.location

  storage_account_name       = azurerm_storage_account.bhmcitsa02.name
  storage_account_access_key = azurerm_storage_account.bhmcitsa02.primary_access_key
  service_plan_id            = azurerm_service_plan.bhmcitaspwin01.id

  site_config {}
}
