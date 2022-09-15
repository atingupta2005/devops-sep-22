# Random String Resource
resource "random_string" "myrandom" {
  length = 8
  upper = false
  special = false
  numeric = false
}

resource "azurerm_resource_group" "my_resourcegroup" {
  name = "rg-u50"
  location = "eastus"
}

resource "azurerm_storage_account" "my_storageaccount" {
  name                     = "sa${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.my_resourcegroup.name
  location                 = azurerm_resource_group.my_resourcegroup.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_storage_container" "tfstatefiles" {
  name                  = "mycontainer"
  storage_account_name  = azurerm_storage_account.my_storageaccount.name
  container_access_type = "private"
}
