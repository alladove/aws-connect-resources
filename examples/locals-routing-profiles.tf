locals {
  routing_profiles = {
    "General" = {
      description                = "Routing to General team"
      default_outbound_queue_key = "General"
      media_concurrencies = [
        { channel = "VOICE", concurrency = 1 },
        { channel = "TASK", concurrency = 10, cross_channel_behavior_type = "ROUTE_ANY_CHANNEL" }
      ]
      queue_configs = [
        {
          queue_reference = { channel = "VOICE", queue_key = "General" }
          priority        = 1
          delay           = 0
        },
        {
          queue_reference = { channel = "TASK", queue_key = "General" }
          priority        = 2
          delay           = 0
        }
      ]
      tags = local.tags_list
    }
    "TechSupport" = {
      description                = "Routing to Technical Support team"
      default_outbound_queue_key = "Technical"
      media_concurrencies = [
        { channel = "VOICE", concurrency = 1 },
        { channel = "TASK", concurrency = 10, cross_channel_behavior_type = "ROUTE_ANY_CHANNEL" }
      ]
      queue_configs = [
        {
          queue_reference = { channel = "VOICE", queue_key = "Technical" }
          priority        = 1
          delay           = 0
        },
        {
          queue_reference = { channel = "TASK", queue_key = "Technical" }
          priority        = 2
          delay           = 0
        }
      ]
      tags = local.tags_list
    }
  }
}
