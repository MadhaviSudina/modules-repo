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
    condition     = contains(["UAT", "Dev", "Prod"], var.environment)
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

variable "vnet_address_spaces" {
  type        = list(string)
  description = "The adress spaces to utilise in the vnet"
}

variable "subnets" {
  type = map(object({
    name                                          = string
    address_prefixes                              = list(string)
    private_link_service_network_policies_enabled = optional(bool, true)
  }))
  default     = {}
  description = "The subnet specifications"
}
