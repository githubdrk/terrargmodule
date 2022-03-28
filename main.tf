locals {
  rg_names = [
    for rg_name_key, rg_name in var.names : {
      rg_name_key = rg_name_key
      rg_name     = rg_name
    }
  ]

  rg_locations = [
    for rg_location_key, rg_location in var.locations : {
      rg_location_key = rg_location_key
      rg_location     = rg_location
    }
  ]

  rg_names_locations = [
    for pair in setproduct(local.rg_names, local.rg_locations) : {
      rg_name_key     = pair[0].rg_name_key
      rg_location_key = pair[1].rg_location_key
      rg_name         = pair[0].rg_name
      rg_location     = pair[1].rg_location
    }
  ]
}


resource "azurerm_resource_group" "rg" {
  for_each = {
    for rg_name_location in local.rg_names_locations : "${rg_name_location.rg_name_key}.${rg_name_location.rg_location_key}" => rg_name_location
  }

  name     = "${each.value.rg_name}-${each.value.rg_location}"
  location = each.value.rg_location

  tags = var.tags
}
