
output "user_identities" {
  description = "All attributes of the user identities"
  value       = { for k, v in azurerm_user_assigned_identity.user_identity : k => v }
}

output "role_assignments" {
  description = "All attributes of the role assignments"
  value       = { for k, v in azurerm_role_assignment.assignment : k => v }
}