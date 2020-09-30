output "azure_bastion_subnet_id" {
  description = "List of IDs of subnets"
  value       = module.azure-bastion.azure_bastion_subnet_id
}

output "azure_bastion_public_ip" {
  description = "The public IP of the virtual network gateway"
  value       = module.azure-bastion.azure_bastion_public_ip
}

output "azure_bastion_public_ip_fqdn" {
  description = "Fully qualified domain name of the virtual network gateway"
  value       = module.azure-bastion.azure_bastion_public_ip_fqdn
}

output "azure_bastion_host_id" {
  description = "The resource ID of the Bastion Host"
  value       = module.azure-bastion.azure_bastion_host_id
}

output "azure_bastion_host_fqdn" {
  description = "The fqdn of the Bastion Host"
  value       = module.azure-bastion.azure_bastion_host_fqdn
}
