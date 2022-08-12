variable cluster_name {
    default = "aks-terraform-cluster"
    type = string
    description = "The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
}

variable resource_group_name {
    default = "aks-terraform-rg"
    type = string
    description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created"
}

variable location {
    default = "centralus"
    type = string
    description = "The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created"
}

variable "client_id" {
    description = "The Client ID for the Service Principal - export TF_VAR_client_id='SPID'"
    type = string
}
variable "client_secret" {
    description = "The Client Secret for the Service Principal - export TF_VAR_client_secret='SPSECRET'"
    type = string
}

variable "identity_type" {
  description = "The type of identity used for the managed cluster. Conflict with `client_id` and `client_secret`. Possible values are `SystemAssigned` and `UserAssigned`. If `UserAssigned` is set, a `user_assigned_identity_id` must be set as well."
  type        = string
  default     = "SystemAssigned"
}

variable "user_assigned_identity_id" {
  description = "The ID of a user assigned identity."
  type        = string
  default     = null
}

variable "enable_azure_policy" {
    type = bool
    default = false
    description = "Flag to enabling Azure Policy"
}

variable "cluster_version" {
    default = "1.22.6"
    type = string
    description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
}

variable "nodepool_version" {
    default = "1.22.6"
    type = string
    description = "Version of Kubernetes used for the Agents. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)"
}

variable "nodepool_type" {
  description = "(Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets."
  type        = string
  default     = "VirtualMachineScaleSets"
}

variable "network_plugin" {
    default = "azure"
    type = string
    description = "Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created."
}

variable "default_agent_count" {
    default = 1
    type = number
    description = "The initial number of Default Linux nodes" 
}

variable "create_linux_user_nodepool" {
    type = bool
    default = false
    description = "Flag to create a Linux user nodepool"
}

variable "linux_agent_count" {
    default = 1
    type = number
    description = "The initial number of Linux nodes which should exist within this Node Pool" 
}

variable "create_windows_user_nodepool" {
    type = bool
    default = false    
    description = "Flag to create a Windows user nodepool"
}

variable "windows_agent_count" {
    default = 1
    type = number
    description = "The initial number of Windows nodes which should exist within this Node Pool"
}

variable "admin_username" {
  default     = "azureuser"
  description = "The username for Windows VMs"
  type        = string
}

variable "admin_password" {  
  description = "The Admin Password for Windows VMs. Length must be between 14 and 123 characters."
  type        = string
  default = "Windows12345#$"
}

variable "load_balancer_sku"{
    default = "standard"
    type = string
    description = "Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are Basic and Standard."
}

variable "sku_linux_vm_size" {
    default = "Standard_D2_v2"
    type = string
    description = "The SKU which should be used for the Linux Virtual Machines used in this Node Pool. Changing this forces a new resource to be created."
}

variable "sku_windows_vm_size" {
    default = "Standard_D4s_v3"
    type = string
    description = "The SKU which should be used for the Windows Virtual Machines used in this Node Pool. Changing this forces a new resource to be created."
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
    type = string
    description = "An ssh_key block. Only one is currently allowed. Changing this forces a new resource to be created"
}

variable "dns_prefix" {
    default = "k8scasetest"
    type = string
    description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created"
}

variable "enable_monitoring" {
    type = bool
    default = false
    description = "Flag to enable Logs Analitics in the AKS cluster"
}

variable "enable_agic" {
    type = bool
    default = false
    description = "Flag to enable AGIC"
}

variable log_analytics_workspace_name {
    default = "testLogAnalyticsWorkspaceName"
    type = string
    description = " Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
    type = string
    description = "Specifies the Sku of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new Sku as of 2018-04-03)"
}
