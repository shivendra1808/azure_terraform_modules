resource_group = {
  rg1 = {
    name     = "rg-chor"
    location = "centralindia"
  }

  rg2 = {
    name     = "rg-sipahi"
    location = "centralindia"
  }
}

virtual_network = {
  vnet1 = {
    name                = "vnet-chor"
    resource_group_name = "rg-chor"
    location            = "centralindia"
    address_space       = ["10.50.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-chor"
    virtual_network_name = "vnet-chor"
    address_prefixes     = ["10.50.50.0/24"]
  }

  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-chor"
    virtual_network_name = "vnet-chor"
    address_prefixes     = ["10.50.51.0/24"]
  }
}

pips = {
  pip1 = {
    public_ip_name      = "pip-chor-frontend-vm"
    resource_group_name = "rg-chor"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    public_ip_name      = "pip-chor-backend-vm"
    resource_group_name = "rg-chor"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}


vms = {
  vm1 = {
    nic_name        = "frontend-vm-nic"
    location        = "centralindia"
    rg_name         = "rg-chor"
    nic_subnet_name = "frontend-subnet"
    nic_vnet_name   = "vnet-chor"
    nic_pip_name    = "pip-chor-frontend-vm"
    vm_name         = "frontend-vm"
    vm_size         = "Standard_D2s_v3"
    admin_username  = "devopsadmin"
    admin_password  = "DevOps@123"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  vm2 = {
    nic_name        = "backend-vm-nic"
    location        = "centralindia"
    rg_name         = "rg-chor"
    nic_subnet_name = "backend-subnet"
    nic_vnet_name   = "vnet-chor"
    nic_pip_name    = "pip-chor-backend-vm"
    vm_name         = "backend-vm"
    vm_size         = "Standard_D2s_v3"
    admin_username  = "devopsadmin"
    admin_password  = "DevOps@123"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
}

nsg = {

  frontend = {

    name                  = "frontend-nsg"

    resource_group_name   = "rg-chor"

    location              = "centralindia"

    virtual_network_name  = "vnet-chor"

    subnet_name           = "frontend-subnet"

    security_rules = {

      SSH = {

        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        destination_port = "22"

      }

      HTTP = {

        priority = 110
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        destination_port = "80"

      }

      HTTPS = {

        priority = 120
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        destination_port = "443"

      }

    }

  }

  backend = {

    name                  = "nsg-backend"

    resource_group_name   = "rg-chor"

    location              = "centralindia"

    virtual_network_name  = "vnet-chor"

    subnet_name           = "backend-subnet"

    security_rules = {

      SSH = {

        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        destination_port = "22"

      }

    }

  }

}