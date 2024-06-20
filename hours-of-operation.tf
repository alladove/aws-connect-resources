locals {
  hours_of_operation = var.enable_contact_instance ? var.hours_of_operation : {}
}

resource "awscc_connect_hours_of_operation" "this" {
  for_each = local.hours_of_operation

  instance_arn = var.connect_instance_arn
  name         = each.value.name
  time_zone    = each.value.time_zone
  description  = each.value.description
  config       = each.value.config
  tags         = each.value.tags != null ? concat(var.tags, each.value.tags) : var.tags
}
