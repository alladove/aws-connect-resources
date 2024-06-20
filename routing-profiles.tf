locals {
  routing_profiles = var.enable_contact_instance ? var.routing_profiles : {}
}

resource "awscc_connect_routing_profile" "this" {
  for_each = local.routing_profiles

  instance_arn               = var.connect_instance_arn
  name                       = each.key
  description                = each.value.description
  default_outbound_queue_arn = awscc_connect_queue.this[each.value.default_outbound_queue_key].queue_arn

  media_concurrencies = [for mc in(sort([for mc in each.value.media_concurrencies : "${mc.channel}:${mc.concurrency}:${coalesce(mc.cross_channel_behavior_type, "ROUTE_CURRENT_CHANNEL_ONLY")}"])) : {
    channel     = split(":", mc)[0]
    concurrency = tonumber(split(":", mc)[1])
    cross_channel_behavior = {
      behavior_type = split(":", mc)[2]
    }
  }]

  queue_configs = each.value.queue_configs != null ? [for qc in each.value.queue_configs : {
    queue_reference = {
      channel   = qc.queue_reference.channel
      queue_arn = awscc_connect_queue.this[qc.queue_reference.queue_key].queue_arn
    }
    priority = qc.priority
    delay    = qc.delay
  }] : []

  tags = each.value.tags != null ? [for tag in each.value.tags : {
    key   = tag.key
    value = tag.value
  }] : []
}
