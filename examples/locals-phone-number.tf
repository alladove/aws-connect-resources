locals {
  phone_numbers = {
    "TechSupport" = {
      description  = "TechSupport"
      prefix       = "+1"
      type         = "DID"
      country_code = "US"

      tags = [{
        key   = "line"
        value = "TechSupport"
      }]
    }

    "GeneralTollFree" = {
      description  = "General toll free number"
      prefix       = "+1"
      type         = "TOLL_FREE"
      country_code = "US"

      tags = [{
        key   = "line"
        value = "General"
      }]
    }
  }
}
