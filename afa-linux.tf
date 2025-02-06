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

resource "azurerm_storage_account" "bhmcitstorage" {
  name                     = "bhstorageaccount"
  storage_account_name       = azurerm_storage_account.bhmcitstorage.name
  storage_account_access_key = azurerm_storage_account.bhmcitstorage.primary_access_key
  service_plan_id            = azurerm_service_plan.bhmcitstorage.id
}

