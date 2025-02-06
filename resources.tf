resource "azurerm_resource_group" "bhmcitrg01" {
  name     = "mcit_resource_group_bh01"
  location = "canadacentral"
}

resource "azurerm_service_plan" "bhmcitasplinux01" {
  name                = "braedenmcitappserviceplan"
  resource_group_name = azurerm_resource_group.bhmcitrg01.name
  location            = azurerm_resource_group.bhmcitrg01.location
  os_type             = "Linux"
  sku_name            = "B1"
}
