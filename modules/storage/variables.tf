variable "proj-shortname" {
  type        = string
  description = "(Required) The identifier which should be used for this resource. Changing this forces a new resource to be created."

  validation {
    condition     = length(var.proj-shortname) >= 1
    error_message = "Project shortname must be defined"
  }
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  default     = false
  description = "allow_blob_public_access - defaults to false"
}

variable "account_replication_type" {
  type    = string
  default = "GRS"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "environment" {
  type        = string
  description = "The environment in which to deploy."

  validation {
    condition     = contains(["Prod", "UAT", "Dev"], var.environment)
    error_message = "The supplied value is not in the accepted environment list"
  }
}

variable "location" {
  type        = string
  description = "(Required) The Azure Region where the resource should exist. Changing this forces a new resource to be created."

  validation {
    condition     = contains(["norwayeast", "westeurope", "swedencentral"], var.location)
    error_message = "The supplied value is not in the accepted region list"
  }
}

variable "resource_group" {
  type        = string
  description = "The name of the resource group in which to deploy."
}


