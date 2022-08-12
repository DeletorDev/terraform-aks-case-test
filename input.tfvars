resource_group_name              = "aks-terraform-vmas-rg"
location                         = "eastus2"
cluster_name                     = "aks-terraform-cluster"
cluster_version                  = "1.22.6"
nodepool_version                 = "1.22.6"
default_agent_count              = 3
create_linux_user_nodepool       = false
linux_agent_count                = 3
create_windows_user_nodepool     = false
windows_agent_count              = 1
dns_prefix                       = "k8s"
enable_monitoring                = false
enable_azure_policy              = false
enable_agic                      = false
identity_type                    = "SystemAssigned"

//"Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard."
load_balancer_sku                = "standard"
log_analytics_workspace_name     = "testLogAnalyticsWorkspaceName"
log_analytics_workspace_sku      = "PerGB2018"

//"Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created."
network_plugin                   = "azure"

//"(Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets."
nodepool_type                    = "VirtualMachineScaleSets"
sku_linux_vm_size                = "Standard_D2_v2"
sku_windows_vm_size              = "Standard_D4s_v3"
ssh_public_key                   = "~/.ssh/id_rsa.pub"
admin_username                   = "azureuser"
user_assigned_identity_id        = null
