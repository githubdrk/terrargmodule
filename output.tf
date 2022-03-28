output "resource_groups" {
  value = {
    for rg_key, rg in azurerm_resource_group.rg :
    rg_key => rg
  }
}
