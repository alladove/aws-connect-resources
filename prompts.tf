locals {
  prompts = var.enable_contact_instance ? var.prompts : {}
}

resource "awscc_connect_prompt" "this" {
  for_each = local.prompts

  instance_arn = var.connect_instance_arn
  name         = each.value.name
  description  = each.value.description
  s3_uri       = "s3://${each.value.bucket}/${each.value.key}"
}
