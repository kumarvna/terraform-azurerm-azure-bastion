# Azure Bastion Service Terraform module

Terraform module to create fully platform-managed Azure bastion PaaS service.

## Module Usage

```hcl
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
```

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply

```

Run `terraform destroy` when you don't need these resources.

## Outputs

Name | Description
---- | -----------
`azure_bastion_subnet_id`|The resource ID of Azure bastion subnet
`azure_bastion_public_ip`|The public IP of the virtual network gateway
`azure_bastion_public_ip_fqdn`|Fully qualified domain name of the virtual network gateway
`azure_bastion_host_id`|The resource ID of the Bastion Host
`azure_bastion_host_fqdn`|The FQDN of the Bastion Host
