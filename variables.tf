variable "enable_contact_instance" {
  description = "Enable the creation of the AWS Connect instance."
  type        = bool
  default     = true
}

variable "connect_instance_arn" {
  description = "The ARN of the AWS Connect instance."
  type        = string
}

variable "hours_of_operation" {
  description = "A map of Hours of Operation configurations where the key is a unique identifier for each Hours of Operation schedule. Each configuration includes properties like 'name', 'time_zone', 'description', and 'config' which is a list of objects including 'day', 'start_times', and 'end_times'. Each 'start_time' and 'end_time' are objects containing 'hours' and 'minutes'."
  type = map(object({
    name : string
    time_zone : string
    description : string
    config : list(object({
      day : string # E.g., "MONDAY"
      start_time : object({
        hours : number
        minutes : number
      })
      end_time : object({
        hours : number
        minutes : number
      })
    }))
    tags : optional(list(object({
      key   = string
      value = string
    })))
  }))
  default = {}
}

variable "phone_numbers" {
  description = "A map of phone numbers where each key is a unique identifier for the phone number."
  type = map(object({
    description : optional(string)
    prefix : optional(string)
    type : optional(string) # Valid Values: TOLL_FREE | DID.
    country_code : optional(string)
    source_phone_number_arn : optional(string)
    tags : optional(list(object({
      key   = string
      value = string
    })))
  }))
  default = {}
}

variable "prompts" {
  description = "A map of prompt configurations."
  type = map(object({
    name        = string
    description = optional(string)
    bucket      = string
    key         = string
  }))
  default = {}
}

variable "queues" {
  description = "A map where the key is the queue name, and the value is an object including queue properties such as 'description', 'outbound_caller_config', and 'hours_of_operation_name' which links to the 'hours_of_operation' map key."
  type = map(object({
    hours_of_operation_key : string # Reference to hours_of_operation map key
    description : optional(string)
    max_contacts : optional(number)
    quick_connect_arns : optional(list(string))
    status : optional(string)
    outbound_caller_config : optional(object({
      outbound_caller_id_name : optional(string)
      outbound_caller_id_phone_number_key : optional(string) # Reference to phone_numbers map key
      outbound_contact_flow_arn : optional(string)           # Since flows are created outside this module, we are passing an arn
    }))
    tags : optional(list(object({
      key   = string
      value = string
    })))
  }))
  default = {}
}

variable "routing_profiles" {
  description = "Map of routing profile configurations."
  type = map(object({
    default_outbound_queue_key : string # Reference to queue map key
    media_concurrencies : list(object({
      channel : string                               # Valid values are VOICE, CHAT, TASK
      concurrency : number                           # VOICE: 1, CHAT: 1-10, TASK: 1-10
      cross_channel_behavior_type : optional(string) # Valid values are ROUTE_CURRENT_CHANNEL_ONLY and ROUTE_ANY_CHANNEL. Defaults to ROUTE_CURRENT_CHANNEL_ONLY
    }))
    description : string
    queue_configs : optional(list(object({
      queue_reference = object({
        channel   = string
        queue_key = string # Reference to queue map key
      })
      priority = number
      delay    = number
    })))
    agent_availability_timer : optional(string) # Whether agents with this routing profile will have their routing order calculated based on longest idle time or time since their last inbound contact.
    tags : optional(list(object({
      key   = string
      value = string
    })))
  }))
  default = {}
}

variable "security_profiles" {
  description = "A map of security profiles where each key is the security profile name, and the value is an object including properties such as 'description' and 'permissions'. For a comprehensive list of possible permissions, refer to the AWS Connect documentation: https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-permissions.html"
  type = map(object({
    description : optional(string)
    permissions : optional(set(string)) # Example: ['HoursOfOperation.Create']. Full list: https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-list.html
    allowed_access_control_hierarchy_group_id : optional(string)
    allowed_access_control_tags : optional(list(object({
      key   = string
      value = string
    })))
    applications : optional(list(object({
      app_name    = string
      app_type    = string
      app_version = string
    })))
    hierarchy_restricted_resources : optional(set(string))
    tag_restricted_resources : optional(set(string))
    tags : optional(list(object({
      key   = string
      value = string
    })))
  }))
  default = {}
}

# Other
variable "tags" {
  description = "A list of tags, where each tag is an object with a key and a value."
  type = list(object({
    key   = string
    value = string
  }))
  default = []
}
