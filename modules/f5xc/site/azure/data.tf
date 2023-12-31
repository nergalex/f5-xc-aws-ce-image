data "azurerm_network_interface" "master-0-sli" {
  depends_on          = [module.site_wait_for_online]
  count               = var.f5xc_azure_ce_gw_type == var.f5xc_nic_type_multi_nic ? 1 : 0
  name                = "master-0-sli"
  resource_group_name = volterra_azure_vnet_site.site.resource_group

}

data "azurerm_network_interface" "master-0-slo" {
  depends_on          = [module.site_wait_for_online]
  name                = "master-0-slo"
  resource_group_name = volterra_azure_vnet_site.site.resource_group

}

data "azurerm_public_ip" "master-0-pib" {
  depends_on          = [module.site_wait_for_online]
  name                = "master-0-public-ip"
  resource_group_name = volterra_azure_vnet_site.site.resource_group
}

data "azurerm_network_interface" "master-1-sli" {
  depends_on          = [module.site_wait_for_online]
  count               = length(var.f5xc_azure_az_nodes) >= 2 && var.f5xc_azure_ce_gw_type == var.f5xc_nic_type_multi_nic ? 1 : 0
  name                = "master-1-sli"
  resource_group_name = volterra_azure_vnet_site.site.resource_group

}

data "azurerm_network_interface" "master-1-slo" {
  depends_on          = [module.site_wait_for_online]
  count               = length(var.f5xc_azure_az_nodes) >= 2 ? 1 : 0
  name                = "master-1-slo"
  resource_group_name = volterra_azure_vnet_site.site.resource_group

}

data "azurerm_public_ip" "master-1-pib" {
  depends_on          = [module.site_wait_for_online]
  count               = length(var.f5xc_azure_az_nodes) >= 2 ? 1 : 0
  name                = "master-1-public-ip"
  resource_group_name = volterra_azure_vnet_site.site.resource_group
}

data "azurerm_network_interface" "master-2-sli" {
  depends_on          = [module.site_wait_for_online]
  count               = length(var.f5xc_azure_az_nodes) >= 2 && var.f5xc_azure_ce_gw_type == var.f5xc_nic_type_multi_nic ? 1 : 0
  name                = "master-2-sli"
  resource_group_name = volterra_azure_vnet_site.site.resource_group

}

data "azurerm_network_interface" "master-2-slo" {
  depends_on          = [module.site_wait_for_online]
  count               = length(var.f5xc_azure_az_nodes) >= 2 ? 1 : 0
  name                = "master-2-slo"
  resource_group_name = volterra_azure_vnet_site.site.resource_group

}

data "azurerm_public_ip" "master-2-pib" {
  depends_on          = [module.site_wait_for_online]
  count               = length(var.f5xc_azure_az_nodes) >= 2 ? 1 : 0
  name                = "master-2-public-ip"
  resource_group_name = volterra_azure_vnet_site.site.resource_group
}

data "azurerm_virtual_network" "service" {
  count               = var.f5xc_azure_existing_vnet_name == "" ? 1 : 0
  name                = local.f5xc_service_vnet_name
  resource_group_name = volterra_azure_vnet_site.site.resource_group
}

data "azurerm_subnet" "master-0-slo-subnet" {
  depends_on           = [module.site_wait_for_online]
  name                 = format("subnet-%s", replace(replace(var.f5xc_azure_az_nodes["node0"]["f5xc_azure_vnet_outside_subnet"], ".", "-"), "/", "-"))
  virtual_network_name = data.azurerm_virtual_network.service[0].name
  resource_group_name  = volterra_azure_vnet_site.site.resource_group
}

data "azurerm_subnet" "master-0-sli-subnet" {
  depends_on           = [module.site_wait_for_online]
  name                 = format("subnet-%s", replace(replace(var.f5xc_azure_az_nodes["node0"]["f5xc_azure_vnet_inside_subnet"], ".", "-"), "/", "-"))
  virtual_network_name = data.azurerm_virtual_network.service[0].name
  resource_group_name  = volterra_azure_vnet_site.site.resource_group
}

data "azurerm_subnet" "master-1-slo-subnet" {
  depends_on           = [module.site_wait_for_online]
  count                = length(var.f5xc_azure_az_nodes) >= 2 ? 1 : 0
  name                 = format("subnet-%s", replace(replace(var.f5xc_azure_az_nodes["node1"]["f5xc_azure_vnet_outside_subnet"], ".", "-"), "/", "-"))
  virtual_network_name = data.azurerm_virtual_network.service[0].name
  resource_group_name  = volterra_azure_vnet_site.site.resource_group
}

data "azurerm_subnet" "master-1-sli-subnet" {
  depends_on           = [module.site_wait_for_online]
  count                = length(var.f5xc_azure_az_nodes) >= 2 ? 1 : 0
  name                 = format("subnet-%s", replace(replace(var.f5xc_azure_az_nodes["node1"]["f5xc_azure_vnet_inside_subnet"], ".", "-"), "/", "-"))
  virtual_network_name = data.azurerm_virtual_network.service[0].name
  resource_group_name  = volterra_azure_vnet_site.site.resource_group
}

data "azurerm_subnet" "master-2-slo-subnet" {
  depends_on           = [module.site_wait_for_online]
  count                = length(var.f5xc_azure_az_nodes) >= 2 ? 1 : 0
  name                 = format("subnet-%s", replace(replace(var.f5xc_azure_az_nodes["node2"]["f5xc_azure_vnet_outside_subnet"], ".", "-"), "/", "-"))
  virtual_network_name = data.azurerm_virtual_network.service[0].name
  resource_group_name  = volterra_azure_vnet_site.site.resource_group
}

data "azurerm_subnet" "master-2-sli-subnet" {
  depends_on           = [module.site_wait_for_online]
  count                = length(var.f5xc_azure_az_nodes) >= 2 ? 1 : 0
  name                 = format("subnet-%s", replace(replace(var.f5xc_azure_az_nodes["node2"]["f5xc_azure_vnet_inside_subnet"], ".", "-"), "/", "-"))
  virtual_network_name = data.azurerm_virtual_network.service[0].name
  resource_group_name  = volterra_azure_vnet_site.site.resource_group
}
