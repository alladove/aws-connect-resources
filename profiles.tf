
# resource "awscc_customerprofiles_domain" "this" {
#   count = var.enable_contact_instance ? 1 : 0

#   domain_name             = var.customer_profiles_domain != null && var.customer_profiles_domain.domain_name != null ? var.customer_profiles_domain.domain_name : "amazon-connect-${var.instance_alias}"
#   dead_letter_queue_url   = var.customer_profiles_domain != null && var.customer_profiles_domain.dead_letter_queue_url != null ? var.customer_profiles_domain.dead_letter_queue_url : null
#   default_encryption_key  = var.customer_profiles_domain != null && var.customer_profiles_domain.default_encryption_key != null ? var.customer_profiles_domain.default_encryption_key : null
#   default_expiration_days = var.customer_profiles_domain != null && var.customer_profiles_domain.default_expiration_days != null ? var.customer_profiles_domain.default_expiration_days : null
#   tags                    = var.customer_profiles_domain != null && var.customer_profiles_domain.tags != null ? [for key, value in var.customer_profiles_domain.tags : { key = key, value = value }] : []
# }
