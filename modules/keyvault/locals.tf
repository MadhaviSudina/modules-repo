locals {
  regions = {
    norwayeast = "noe"
    westeurope = "weu"
    swedencentral = "swec"
  }
}

locals {
  environments = {
    Dev  = "n"
    UAT  = "uat"
    Prod = "p"
  }
}

locals {
  name = "${var.proj-shortname}${local.environments[var.environment]}${local.regions[var.location]}akv"
}

data "azurerm_client_config" "current" {}
