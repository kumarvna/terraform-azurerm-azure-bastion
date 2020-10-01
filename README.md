# Azure Bastion Service Terraform module

The Azure Bastion service is a fully platform-managed PaaS service that provision inside the virtual network. It provides secure and seamless RDP/SSH connectivity to the virtual machines directly in the Azure portal over TLS. When connecting via Azure Bastion, the virtual machines do not need a public IP address.

Azure Bastion deployment is per virtual network, not per subscription/account or virtual machine. Once provisioned an Azure Bastion service in the virtual network, the RDP/SSH experience is available to all the VMs in the same virtual network.

## Module Usage

```hcl
module "azure-bastion" {
  source  = "kumarvna/azure-bastion/azurerm"
  version = "1.0.0"

  # Resource Group, location, VNet and Subnet details
  resource_group_name  = "rg-shared-westeurope-01"
  virtual_network_name = "vnet-shared-hub-westeurope-001"

  # Azure bastion server requireemnts
  azure_bastion_service_name          = "mybastion-service"
  azure_bastion_subnet_address_prefix = ["10.5.0.0/26"]

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

## Pre-requisites
You’re making changes in a project you don’t have write access to.

### Virtual network

You can create a new virtual network in the portal during this process, or use an existing virtual network to create Azure bastion service. If you are using an existing virtual network, make sure the existing virtual network has enough free address space to accommodate the Bastion subnet requirements.

### Subnet

The subnet will be dedicated to the Bastion host and must be named as `AzureBastionSubnet`. This subnet must be at least `/27` or larger.  User-defined routing (UDR) is not supported on an Azure Bastion subnet. For scenarios that include both Azure Bastion and Azure Firewall/Network Virtual Appliance (NVA) in the same virtual network, you don’t need to force traffic from an Azure Bastion subnet to Azure Firewall because the communication between Azure Bastion and your VMs is private.

### Public IP address

The public IP of the Bastion resource on which RDP/SSH will be accessed (over port 443). Create a new public IP, or use an existing one. The public IP address must be in the same region as the Bastion resource you are creating.  Public IP address SKU by default to `Standard` and Azure Bastion uses/supports only the Standard Public IP SKU with a static assignment.

## Requirements

Name | Version
-----|--------
terraform | >= 0.13
azurerm | ~> 2.27

## Providers

| Name | Version |
|------|---------|
azurerm | 2.27.0

## Inputs

Name | Description | Type | Default
---- | ----------- | ---- | -------
`resource_group_name` | The name of the resource group in which resources are created | string | `""`
`virtual_network_name`|The name of the virtual network|string|`""`
`public_ip_allocation_method`|Defines the allocation method for this IP address. Possible values are `Static` or `Dynamic`|static|`"Static"`
`public_ip_sku`|The SKU of the Public IP. Accepted values are `Basic` and `Standard`|string|`"Standard"`
`domain_name_label`|Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system|string|`null`
`azure_bastion_service_name`|Specifies the name of the Bastion Host|string|`""`
`azure_bastion_subnet_address_prefix`|The address prefix to use for the Azure Bastion subnet|list|`[]`
`tags`|A map of tags to add to all resources|map(string)|`{}`

## Outputs

Name | Description
---- | -----------
`azure_bastion_subnet_id`|The resource ID of Azure bastion subnet
`azure_bastion_public_ip`|The public IP of the virtual network gateway
`azure_bastion_public_ip_fqdn`|Fully qualified domain name of the virtual network gateway
`azure_bastion_host_id`|The resource ID of the Bastion Host
`azure_bastion_host_fqdn`|The FQDN of the Bastion Host

## Resource Graph

![Resource Graph](graph.png)

## Authors

Originally created by [Kumaraswamy Vithanala](mailto:kumarvna@gmail.com)

## Other resources

* [Azure Bastion Service](https://docs.microsoft.com/en-us/azure/bastion/bastion-overview#next-steps)
* [Terraform AzureRM Provider Documentation](https://www.terraform.io/docs/providers/azurerm/index.html)
