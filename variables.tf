variable "client_id" {}
variable "client_secret" {}

variable "identity_type" {
  description = "(Optional) The type of identity used for the managed cluster. Conflict with `client_id` and `client_secret`. Possible values are `SystemAssigned` and `UserAssigned`. If `UserAssigned` is set, a `user_assigned_identity_id` must be set as well."
  type        = string
  default     = "SystemAssigned"
}

variable "user_assigned_identity_id" {
  description = "(Optional) The ID of a user assigned identity."
  type        = string
  default     = null
}

variable cluster_name {
    default = "clustertest"
}

variable "cluster_version" {
    default = "1.20.7"
}

variable "nodepool_version" {
    default = "1.20.7"
}

variable "nodepool_type" {
  description = "(Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets."
  type        = string
  default     = "AvailabilitySet"
}

variable "network_plugin" {
    default = "azure"
}

variable "create_linux_user_nodepool" {
    type = bool
    default = false    
}

variable "linux_agent_count" {
    default = 1 
}

variable "create_windows_user_nodepool" {
    type = bool
    default = false    
}

variable "windows_agent_count" {
    default = 1 
}

variable "admin_username" {
  default     = "azureuser"
  description = "The username for Windows VMs"
  type        = string
}

variable "admin_password" {
  default     = ""
  description = "The Admin Password for Windows VMs. Length must be between 14 and 123 characters."
  type        = string
}

variable "load_balancer_sku"{
    default = "Standard"
}

variable "sku_linux_vm_size" {
    default = "Standard_D2_v2"
}

variable "sku_windows_vm_size" {
    default = "Standard_D4s_v3"
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "k8stest"
}

variable resource_group_name {
    default = "aks-terraform-rg"
}

variable location {
    default = "centralus"
}

variable "enable_monitoring" {
    type = bool
    default = false
}

variable log_analytics_workspace_name {
    default = "testLogAnalyticsWorkspaceName"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "centralus"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}
