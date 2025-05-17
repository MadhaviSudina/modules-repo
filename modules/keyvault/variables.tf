variable "proj-shortname" {
  type        = string
  description = "(Required) The identifier which should be used for this resource. Changing this forces a new resource to be created."

  validation {
    condition     = length(var.proj-shortname) >= 1
    error_message = "Project shortname must be defined"
  }
}

variable "environment" {
  type        = string
  description = "The environment in which to deploy."

  validation {
    condition     = contains(["Prod", "UAT", "Dev"], var.environment)
    error_message = "The supplied value is not in the accepted environment list"
  }
}

variable "resource_group" {
  type        = string
  description = "The name of the resource group in which to deploy."
}

variable "location" {
  type        = string
  description = "(Required) The Azure Region where the resource should exist. Changing this forces a new resource to be created."

  validation {
    condition     = contains(["eastus", "westeurope"], var.location)
    error_message = "The supplied value is not in the accepted region list"
  }
}

variable "sku_name" {
  type        = string
  description = "The name of the SKU for the key vault. Possible values are standard and premium."

  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "sku_name must be either standard or premium. ${var.sku_name} does not fit."
  }
}

variable "enable_rbac_authorization" {
  type        = bool
  default     = true
  description = "(Optional) Use RBAC access control for the key vault. Defaults to true"
}

variable "public_network_access_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Boolean flag to specify whether the key vault is reachable without a private endpoint."
}

variable "network_acl_bypass" {
  type        = string
  default     = "None"
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None"

  validation {
    condition     = contains(["None", "AzureServices"], var.network_acl_bypass)
    error_message = "network_acl_buypass is not a valid entry. Possible values are AzureServices and None"
  }
}

variable "network_acl_default_action" {
  type        = string
  default     = "Deny"
  description = "The Default Action to use when no rules match from network_acl_ip_rules / network_acl_virtual_network_subnet_ids. Possible values are Allow and Deny"

  validation {
    condition     = contains(["Allow", "Deny"], var.network_acl_default_action)
    error_message = "network_acl_default_action is not a valid entry. Possible values are Allow and Deny"
  }
}

variable "network_acl_ip_rules" {
  type        = list(string)
  default     = []
  description = "The list of allowed ips"
}

variable "network_acl_virtual_network_subnet_ids" {
  type        = list(string)
  default     = []
  description = "The list of allowed subnet ids"
}

variable "soft_delete_retention_days" {
  type        = number
  default     = 7
  description = "The number of days to retain deleted objects, must be between 7 and 90 days."

  validation {
    condition     = var.soft_delete_retention_days >= 7
    error_message = "Soft delete must be greater than or equal to 7 days"
  }
  validation {
    condition     = var.soft_delete_retention_days <= 90
    error_message = "Soft delete must be less than or equal to 90 days"
  }
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Should the key vault be purge protected. NB! Can not remove purge protection after being enabled."
  default     = false
}
