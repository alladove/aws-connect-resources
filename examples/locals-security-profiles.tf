locals {
  # Amazon connect gets deployed with initial set of security profiles.
  # These are additional or custom profiles you may need.
  security_profiles = {
    "ScheduleManager" = {
      description = "Permissions to manage hours of operation"
      permissions = [
        "HoursOfOperation.View",
        "HoursOfOperation.Create",
        "HoursOfOperation.Delete",
        "HoursOfOperation.Edit"
      ]
      tags = [
        {
          key   = "Role"
          value = "ScheduleManager"
        }
      ]
    }
  }
}
