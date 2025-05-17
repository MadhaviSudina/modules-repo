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
  name = "${var.proj-shortname}-${local.environments[var.environment]}-${local.regions[var.location]}-vnet"
}
