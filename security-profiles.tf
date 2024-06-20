locals {
  security_profiles = var.enable_contact_instance ? var.security_profiles : {}
}

resource "awscc_connect_security_profile" "this" {
  for_each = local.security_profiles

  instance_arn          = var.connect_instance_arn
  security_profile_name = each.key
  description           = each.value.description
  permissions           = each.value.permissions

  allowed_access_control_hierarchy_group_id = each.value.allowed_access_control_hierarchy_group_id
  allowed_access_control_tags = each.value.allowed_access_control_tags != null ? [for tag in each.value.allowed_access_control_tags : {
    key   = tag.key
    value = tag.value
  }] : null
  applications = each.value.applications != null ? [for app in each.value.applications : {
    app_name    = app.app_name
    app_type    = app.app_type
    app_version = app.app_version
  }] : null
  hierarchy_restricted_resources = each.value.hierarchy_restricted_resources
  tag_restricted_resources       = each.value.tag_restricted_resources
  tags = each.value.tags != null ? [for tag in each.value.tags : {
    key   = tag.key
    value = tag.value
  }] : []
}
