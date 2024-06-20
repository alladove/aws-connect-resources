locals {
  hours_of_operation = {
    "Normal" = {
      name        = "Normal"
      time_zone   = "US/Eastern"
      description = "Normal business hours"
      config = [
        {
          day        = "MONDAY"
          start_time = { hours = 8, minutes = 0 }
          end_time   = { hours = 17, minutes = 0 }
        },
        {
          day        = "TUESDAY"
          start_time = { hours = 8, minutes = 0 }
          end_time   = { hours = 17, minutes = 0 }
        },
        {
          day        = "WEDNESDAY"
          start_time = { hours = 8, minutes = 0 }
          end_time   = { hours = 17, minutes = 0 }
        },
        {
          day        = "THURSDAY"
          start_time = { hours = 8, minutes = 0 }
          end_time   = { hours = 17, minutes = 0 }
        },
        {
          day        = "FRIDAY"
          start_time = { hours = 8, minutes = 0 }
          end_time   = { hours = 17, minutes = 0 }
        }
      ]
    }
  }
}