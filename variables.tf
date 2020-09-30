variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  default     = ""
}

variable "public_ip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  default     = "Static"
}

variable "public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  default     = "Standard"
}

variable "domain_name_label" {
  description = "Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system"
  default     = null
}

variable "azure_bastion_service_name" {
  description = "Specifies the name of the Bastion Host"
  default     = ""
}

variable "azure_bastion_subnet_address_prefix" {
  description = "The address prefix to use for the Azure Bastion subnet"
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
