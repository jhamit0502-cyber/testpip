resource "azurerm_resource_group" "rg1" {
    for_each = var.rgs
  name = each.value.rg_name
  location = each.value.location
}

resource "azurerm_storage_account" "strg1" {
  for_each = {
    key1= { 
  name                    = "sumitstrg1"
  resource_group_name      = "sumit"
  location                 = "westus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  }
  key2={
  name                     = "strg33"
  resource_group_name      = "sumit"
  location                 =  "westus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  }
  }
  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.rg1["rg1"].name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}