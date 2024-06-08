## Usage

```terraform

module "user-identity" {
  source = "./module/user-identity"

  user_identities = {
    "identity1" = "value1",
    "identity2" = "value2"
  }

  resource_group_name = module.resource_group.resource_groups["we-ydev-azus-opdx-arutzim-rg"].name
  location            = module.resource_group.resource_groups["we-ydev-azus-opdx-arutzim-rg"].location
  role_definition_name = {
    "identity1" = "Reader",
    "identity2" = "Contributor"
  }
  scopes = {
    "identity1" = ["${data.azurerm_subscription.current.id}", "${data.azurerm_subscription.sandbox.id}" ],
    "identity2" = ["${data.azurerm_subscription.sandbox.id}"]
  }

depends_on = [ module.resource_group ]
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.user_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | Map of role definition names for each user identity | `map(string)` | n/a | yes |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | Map of scopes for each user identity | `map(list(string))` | n/a | yes |
| <a name="input_user_identities"></a> [user\_identities](#input\_user\_identities) | Map of user identities to create | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_assignments"></a> [role\_assignments](#output\_role\_assignments) | All attributes of the role assignments |
| <a name="output_user_identities"></a> [user\_identities](#output\_user\_identities) | All attributes of the user identities |
