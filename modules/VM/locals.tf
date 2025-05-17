locals {
  regions = {
    eastus     = "eau"
    westeurope = "weu"
  }
}

locals {
  environments = {
    Dev  = "d"
    UAT  = "uat"
    Prod = "p"
  }
}

locals {
  name     = "${var.proj-shortname}${local.regions[var.location]}-${var.os}-${local.environments[var.environment]}-vm"
  nic_name = "${var.proj-shortname}${local.regions[var.location]}-${var.os}-${local.environments[var.environment]}-nic"
}
