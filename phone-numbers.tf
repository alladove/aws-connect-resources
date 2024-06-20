locals {
  phone_numbers = var.enable_contact_instance ? var.phone_numbers : {}
}

resource "awscc_connect_phone_number" "this" {
  for_each = local.phone_numbers

  target_arn              = var.connect_instance_arn
  description             = each.value.description
  prefix                  = each.value.prefix
  type                    = each.value.type
  country_code            = each.value.country_code
  source_phone_number_arn = each.value.source_phone_number_arn
  tags                    = each.value.tags != null ? concat(var.tags, each.value.tags) : var.tags
}
