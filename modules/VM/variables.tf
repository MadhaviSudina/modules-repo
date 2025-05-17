variable "proj-shortname" {
  type        = string
  description = "(Required) The identifier which should be used for this resource. Changing this forces a new resource to be created."

  validation {
    condition     = length(var.proj-shortname) >= 1
    error_message = "Project shortname must be defined"
  }
}

variable "context" {
  type        = string
  description = "(Required) The contextual identifier which should be used for this resource. Changing this forces a new resource to be created."

  validation {
    condition     = length(var.context) >= 1
    error_message = "Context must be defined"
  }

  validation {
    condition     = length(var.context) <= 9
    error_message = "Context must be less than or equal to 9 characters"
  }
}

variable "environment" {
  type        = string
  description = "The environment in which to deploy."

  validation {
    condition     = contains(["Prod", "UAT", "Test", "Dev"], var.environment)
    error_message = "The supplied value is not in the accepted environment list"
  }
}

variable "location" {
  type        = string
  description = "(Required) The Azure Region where the resource should exist. Changing this forces a new resource to be created."

  validation {
    condition     = contains(["eastus", "westeurope"], var.location)
    error_message = "The supplied value is not in the accepted region list"
  }
}

variable "linux_configuration" {
  type = object({
    admin_username = string
    public_key     = string
  })
}
# variable "public_ip_address_name" {
#   type        = string
#   description = "Name of public IP address"
#   default     = null
# }

# variable "public_ip_address_version" {
#   type        = string
#   description = "Ip version (ipv4 or ipv6)"
#   default     = "IPv4"
# }

variable "os" {
  type        = string
  description = "The os used in the scale set. Linux(L) or Windows(w). Defaults to Linux"
  default     = "l"
  ## Further implementation: set up support for windows. 
  validation {
    condition     = contains(["l"], var.os)
    error_message = "The supplied value is not a valid os (w for Windows, l for Linux)"
  }
}

variable "os_disk" {
  type = object({
    caching              = string
    storage_account_type = string
  })
  description = "The OS disk properties."
}


variable "sku_name" {
  type        = string
  description = "The name of the SKU to be used by this Virtual Machine Scale Set"
  default     = "Standard_D2s_v5"
}

variable "source_image_id" {
  type        = string
  description = "The source image for to be used by the VM's"
  default     = null
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "Reference to the source image"
}

variable "subnet_id" {
  type        = string
  description = "Subnet id for the VM's"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}
