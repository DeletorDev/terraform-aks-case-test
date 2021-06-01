<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The Admin Password for Windows VMs. Length must be between 14 and 123 characters. | `string` | `""` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username for Windows VMs | `string` | `"azureuser"` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | n/a | `any` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | n/a | `any` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"clustertest"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | n/a | `string` | `"1.20.7"` | no |
| <a name="input_create_linux_user_nodepool"></a> [create\_linux\_user\_nodepool](#input\_create\_linux\_user\_nodepool) | n/a | `bool` | `false` | no |
| <a name="input_create_windows_user_nodepool"></a> [create\_windows\_user\_nodepool](#input\_create\_windows\_user\_nodepool) | n/a | `bool` | `false` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | n/a | `string` | `"k8stest"` | no |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | n/a | `bool` | `false` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | (Optional) The type of identity used for the managed cluster. Conflict with `client_id` and `client_secret`. Possible values are `SystemAssigned` and `UserAssigned`. If `UserAssigned` is set, a `user_assigned_identity_id` must be set as well. | `string` | `"SystemAssigned"` | no |
| <a name="input_linux_agent_count"></a> [linux\_agent\_count](#input\_linux\_agent\_count) | n/a | `number` | `1` | no |
| <a name="input_load_balancer_sku"></a> [load\_balancer\_sku](#input\_load\_balancer\_sku) | n/a | `string` | `"Standard"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"centralus"` | no |
| <a name="input_log_analytics_workspace_location"></a> [log\_analytics\_workspace\_location](#input\_log\_analytics\_workspace\_location) | refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions | `string` | `"centralus"` | no |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | n/a | `string` | `"testLogAnalyticsWorkspaceName"` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing | `string` | `"PerGB2018"` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | n/a | `string` | `"azure"` | no |
| <a name="input_nodepool_type"></a> [nodepool\_type](#input\_nodepool\_type) | (Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets. | `string` | `"AvailabilitySet"` | no |
| <a name="input_nodepool_version"></a> [nodepool\_version](#input\_nodepool\_version) | n/a | `string` | `"1.20.7"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"aks-terraform-rg"` | no |
| <a name="input_sku_linux_vm_size"></a> [sku\_linux\_vm\_size](#input\_sku\_linux\_vm\_size) | n/a | `string` | `"Standard_D2_v2"` | no |
| <a name="input_sku_windows_vm_size"></a> [sku\_windows\_vm\_size](#input\_sku\_windows\_vm\_size) | n/a | `string` | `"Standard_D4s_v3"` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | n/a | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_user_assigned_identity_id"></a> [user\_assigned\_identity\_id](#input\_user\_assigned\_identity\_id) | (Optional) The ID of a user assigned identity. | `string` | `null` | no |
| <a name="input_windows_agent_count"></a> [windows\_agent\_count](#input\_windows\_agent\_count) | n/a | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cluster_password"></a> [cluster\_password](#output\_cluster\_password) | n/a |
| <a name="output_cluster_username"></a> [cluster\_username](#output\_cluster\_username) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
<!-- END_TF_DOCS -->