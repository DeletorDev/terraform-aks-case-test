admin_username                   = "azureuser"
client_id                        = ""
client_secret                    = ""
cluster_name                     = "clustertest"
cluster_version                  = "1.19.9"
create_linux_user_nodepool       = false
create_windows_user_nodepool     = false
dns_prefix                       = "k8scasetest"
enable_monitoring                = false
identity_type                    = "SystemAssigned"
linux_agent_count                = 1
load_balancer_sku                = "Standard"
location                         = "eastus"
log_analytics_workspace_location = "eastus"
log_analytics_workspace_name     = "testLogAnalyticsWorkspaceName"
log_analytics_workspace_sku      = "PerGB2018"
network_plugin                   = "azure"
nodepool_type                    = "VirtualMachineScaleSets"
nodepool_version                 = "1.19.9"
resource_group_name              = "aks-terraform-rg"
sku_linux_vm_size                = "Standard_D2_v2"
sku_windows_vm_size              = "Standard_D4s_v3"
ssh_public_key                   = "~/.ssh/id_rsa.pub"
user_assigned_identity_id        = ""
windows_agent_count              = 1