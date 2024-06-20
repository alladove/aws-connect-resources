locals {
  tags = {
    project = "important-project"
  }

  # awscc modules prefer lists to maps
  tags_list = [for key, value in local.tags : { key = key, value = value }]
}

module "resources" {
  source = "./.."

  enable_contact_instance = true
  connect_instance_arn    = var.connect_instance_arn
  phone_numbers           = local.phone_numbers
  hours_of_operation      = local.hours_of_operation
  queues                  = local.queues
  prompts                 = local.prompts

  routing_profiles  = local.routing_profiles
  security_profiles = local.security_profiles

  tags = local.tags_list
}