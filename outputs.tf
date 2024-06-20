output "phone_numbers" {
  value = var.enable_contact_instance ? {
    for idx, phone in awscc_connect_phone_number.this :
    idx => {
      address     = phone.address
      arn         = phone.phone_number_arn
      description = phone.description
    }
  } : null
  description = "All phone numbers with key, address, arn, and description."
}

output "hours_of_operation" {
  value = var.enable_contact_instance ? {
    for idx, schedule in awscc_connect_hours_of_operation.this :
    idx => {
      arn         = schedule.hours_of_operation_arn
      description = schedule.description
    }
  } : null
  description = "All hours of operation with key, arn, and description."
}

output "queues" {
  value = var.enable_contact_instance ? {
    for idx, queue in awscc_connect_queue.this :
    idx => {
      arn         = queue.queue_arn
      description = queue.description
    }
  } : null
  description = "All queues with key, arn, and description."
}

output "prompts" {
  value = var.enable_contact_instance ? {
    for idx, prompt in awscc_connect_prompt.this :
    idx => {
      arn         = prompt.prompt_arn
      name        = prompt.name
      description = prompt.description
    }
  } : null
  description = "All prompts with key, arn, name and description."
}

output "routing_profiles" {
  value = var.enable_contact_instance ? {
    for idx, profile in awscc_connect_routing_profile.this :
    idx => {
      arn         = profile.routing_profile_arn
      description = profile.description
    }
  } : null
  description = "All profiles with key, arn, and description."
}

output "security_profiles" {
  value = var.enable_contact_instance ? {
    for idx, profile in awscc_connect_security_profile.this :
    idx => {
      arn                = profile.security_profile_arn
      description        = profile.description
      last_modified_time = profile.last_modified_time
    }
  } : null
  description = "All profiles with key, arn, last modified time and description."
}