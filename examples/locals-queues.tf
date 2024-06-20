locals {
  queues = {
    "Technical" = {
      hours_of_operation_key = "Normal"
      description            = "Tech Support team's queue"
      status                 = "ACTIVE"
      outbound_caller_config = {
        outbound_caller_id_name             = "My Company's Tech Support"
        outbound_caller_id_phone_number_key = "TechSupport"
      }
    }

    "General" = {
      hours_of_operation_key = "Normal"
      description            = "general queue"
      status                 = "ACTIVE"

      outbound_caller_config = {
        outbound_caller_id_name             = "My Company"
        outbound_caller_id_phone_number_key = "GeneralTollFree"
      }
    }
  }
}
