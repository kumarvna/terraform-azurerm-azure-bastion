# Azurerm Provider configuration
provider "azurerm" {
  features {}
}

module "azure-bastion" {
  source  = "kumarvna/azure-bastion/azurerm"
  version = "1.2.0"

  # Resource Group, location, VNet and Subnet details
  resource_group_name  = "rg-shared-westeurope-01"
  virtual_network_name = "vnet-shared-hub-westeurope-001"

  # Azure bastion server requireemnts
  azure_bastion_service_name          = "mybastion-service"
  azure_bastion_subnet_address_prefix = ["10.1.5.0/26"]
  bastion_host_sku                    = "Standard"
  scale_units                         = 10

  # Adding TAG's to your Azure resources (Required)
  tags = {
    ProjectName  = "demo-internal"
    Env          = "dev"
    Owner        = "user@example.com"
    BusinessUnit = "CORP"
    ServiceClass = "Gold"
  }
}
