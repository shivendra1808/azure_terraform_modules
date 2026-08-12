module "resource_group" {
  source = "../../child_modules/azurerm_resource_group"

  resource_group = var.resource_group
}

module "virtual_network" {
  source = "../../child_modules/azurerm_virtual_network"

  depends_on = [module.resource_group]

  virtual_network = var.virtual_network
}

module "subnet" {
  source = "../../child_modules/azurerm_subnet"

  depends_on = [module.virtual_network]

  subnet = var.subnet
}

module "nsg" {

  source = "../../child_modules/azurerm_network_security_group"

  depends_on = [module.subnet]

  nsg = var.nsg

}

module "pips" {
  source     = "../../child_modules/azurerm_public_ip"
  depends_on = [module.resource_group]
  pips       = var.pips
}

module "vms" {
  source     = "../../child_modules/azurerm_virtual_machine"
  depends_on = [module.subnet, module.pips]
  vms        = var.vms
}
