<!-- BEGIN_TF_DOCS -->

# terraform-aks-case-test

## This Terraform scripts deploy a Kubernetes cluster on Azure using AKS (Azure Kubernetes Service).

- on/off support for monitoring with Log Analytics.
- Create User Windows/Linux nodepools.

<br />

#### Usage: After cloning the repository, just *modified* the file *variables.tf* with your custom values.
<br />

> After executing terraform apply command the prompt will ask for admin_password, client_id, and client_secret, but if you create below env vars the prompt won't showing up.
<br />

* export TF_VAR_admin_password='AdminPWD'
* export TF_VAR_client_id='SPID'
* export TF_VAR_client_secret='SPSECRET'
<br />

> If you have not assigned client_id or client_secret, a SystemAssigned identity will be created.

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The Admin Password for Windows VMs. Length must be between 8 and 123 characters. | `string` | export TF\_VAR\_admin\_password='*AdminPWD*' | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username for Windows VMs | `string` | `"azureuser"` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The Client ID for the Service Principal. | `string` | export TF\_VAR\_client\_id='SPID' | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The Client Secret for the Service Principal. | `string` | export TF\_VAR\_client\_secret='SPSECRET' | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created. | `string` | `"clustertest"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). | `string` | `"1.20.7"` | no |
| <a name="input_create_linux_user_nodepool"></a> [create\_linux\_user\_nodepool](#input\_create\_linux\_user\_nodepool) | Flag to create a Linux user nodepool | `bool` | `false` | no |
| <a name="input_create_windows_user_nodepool"></a> [create\_windows\_user\_nodepool](#input\_create\_windows\_user\_nodepool) | Flag to create a Windows user nodepool | `bool` | `false` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created | `string` | `"k8scasetest"` | no |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | Flag to enable Logs Analitics in the AKS cluster | `bool` | `false` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The type of identity used for the managed cluster. Conflict with `client_id` and `client_secret`. Possible values are `SystemAssigned` and `UserAssigned`. If `UserAssigned` is set, a `user_assigned_identity_id` must be set as well. | `string` | `"SystemAssigned"` | no |
| <a name="input_linux_agent_count"></a> [linux\_agent\_count](#input\_linux\_agent\_count) | The initial number of Linux nodes which should exist within this Node Pool | `number` | `1` | no |
| <a name="input_load_balancer_sku"></a> [load\_balancer\_sku](#input\_load\_balancer\_sku) | Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are Basic and Standard. | `string` | `"Standard"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created | `string` | `"centralus"` | no |
| <a name="input_log_analytics_workspace_location"></a> [log\_analytics\_workspace\_location](#input\_log\_analytics\_workspace\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created | `string` | `"centralus"` | no |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created | `string` | `"testLogAnalyticsWorkspaceName"` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Specifies the Sku of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new Sku as of 2018-04-03) | `string` | `"PerGB2018"` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created. | `string` | `"azure"` | no |
| <a name="input_nodepool_type"></a> [nodepool\_type](#input\_nodepool\_type) | (Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets. | `string` | `"VirtualMachineScaleSets"` | no |
| <a name="input_nodepool_version"></a> [nodepool\_version](#input\_nodepool\_version) | Version of Kubernetes used for the Agents. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade) | `string` | `"1.20.7"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created | `string` | `"aks-terraform-rg"` | no |
| <a name="input_sku_linux_vm_size"></a> [sku\_linux\_vm\_size](#input\_sku\_linux\_vm\_size) | The SKU which should be used for the Linux Virtual Machines used in this Node Pool. Changing this forces a new resource to be created. | `string` | `"Standard_D2_v2"` | no |
| <a name="input_sku_windows_vm_size"></a> [sku\_windows\_vm\_size](#input\_sku\_windows\_vm\_size) | The SKU which should be used for the Windows Virtual Machines used in this Node Pool. Changing this forces a new resource to be created. | `string` | `"Standard_D4s_v3"` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | An ssh\_key block. Only one is currently allowed. Changing this forces a new resource to be created | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_user_assigned_identity_id"></a> [user\_assigned\_identity\_id](#input\_user\_assigned\_identity\_id) | The ID of a user assigned identity. | `string` | `null` | no |
| <a name="input_windows_agent_count"></a> [windows\_agent\_count](#input\_windows\_agent\_count) | The initial number of Windows nodes which should exist within this Node Pool | `number` | `1` | no |
<!-- END_TF_DOCS -->