variable "user_identities" {
  description = "Map of user identities to create"
  type        = map(string)
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "role_definition_name" {
  description = "Map of role definition names for each user identity"
  type        = map(string)
}

variable "scopes" {
  description = "Map of scopes for each user identity"
  type        = map(list(string))
}