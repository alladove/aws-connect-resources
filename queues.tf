locals {
  queues = var.enable_contact_instance ? var.queues : {}
}

resource "awscc_connect_queue" "this" {
  for_each = local.queues

  instance_arn           = var.connect_instance_arn
  name                   = each.key
  description            = each.value.description
  hours_of_operation_arn = awscc_connect_hours_of_operation.this[each.value.hours_of_operation_key].hours_of_operation_arn

  outbound_caller_config = {
    outbound_caller_id_name       = each.value.outbound_caller_config != null && each.value.outbound_caller_config.outbound_caller_id_name != null ? each.value.outbound_caller_config.outbound_caller_id_name : null
    outbound_caller_id_number_arn = each.value.outbound_caller_config != null && each.value.outbound_caller_config.outbound_caller_id_phone_number_key != null ? awscc_connect_phone_number.this[each.value.outbound_caller_config.outbound_caller_id_phone_number_key].phone_number_arn : null
    outbound_flow_arn             = each.value.outbound_caller_config != null ? each.value.outbound_caller_config.outbound_contact_flow_arn : null
  }

  tags = each.value.tags != null ? concat(var.tags, each.value.tags) : var.tags
}
