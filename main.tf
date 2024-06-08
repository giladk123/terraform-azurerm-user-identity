resource "azurerm_user_assigned_identity" "user_identity" {
  for_each = var.user_identities

  name                = each.key
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_role_assignment" "assignment" {
  for_each = { for i, v in flatten([
    for k, u in azurerm_user_assigned_identity.user_identity : [
      for s in var.scopes[k] : {
        identity_name = k
        scope = s
        principal_id = u.principal_id
      }
    ]
  ]) : i => v }

  principal_id         = each.value.principal_id
  role_definition_name = var.role_definition_name[each.value.identity_name]
  scope                = each.value.scope
}