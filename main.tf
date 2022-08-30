terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.20.0"
    }
  }
}

provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you are using version 1.x, the "features" block is not allowed.
    #version = "=2.40.0"
    features {}
}

resource "azurerm_resource_group" "k8s" {
    name     = var.resource_group_name
    location = var.location
    tags = {
        Environment = "Case Testing"
    }
}

resource "random_id" "log_analytics_workspace_name_suffix" {
    count = var.enable_monitoring ? 1 : 0
    byte_length = 8
}

resource "azurerm_log_analytics_workspace" "test" {
    count = var.enable_monitoring ? 1 : 0
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    name                = "${var.log_analytics_workspace_name}_${random_id.log_analytics_workspace_name_suffix[0].dec}"
    location            = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    sku                 = var.log_analytics_workspace_sku
}
//depends_on = [azurerm_resource_group]

resource "azurerm_log_analytics_solution" "test" {
    count = var.enable_monitoring ? 1 : 0
    solution_name         = "ContainerInsights"
    location              = azurerm_resource_group.k8s.location
    resource_group_name   = azurerm_resource_group.k8s.name
    workspace_resource_id = azurerm_log_analytics_workspace.test[0].id
    workspace_name        = azurerm_log_analytics_workspace.test[0].name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}

resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    dns_prefix          = var.dns_prefix
    kubernetes_version  = var.cluster_version 
    azure_policy_enabled = var.enable_azure_policy

    linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            key_data = file(var.ssh_public_key)
        }
    }

    windows_profile {      
        admin_username = var.admin_username
        admin_password = var.admin_password
    
    }

    default_node_pool {      
        name                 = "agentpool"
        node_count           = var.default_agent_count
        vm_size              = var.sku_linux_vm_size
        orchestrator_version = var.nodepool_version
        type                 = var.nodepool_type

    }

    dynamic "service_principal" {
        for_each = var.client_id != "" && var.client_secret != "" ? ["service_principal"] : []
        content {
            client_id     = var.client_id
            client_secret = var.client_secret
        }
    }

    dynamic "identity" {
        for_each = var.client_id == "" || var.client_secret == "" ? ["identity"] : []
        content {
            type = var.identity_type
            identity_ids = var.user_assigned_identity_id
        }
    }
    
    dynamic oms_agent {        
        for_each = var.enable_monitoring ? ["Enabled"] : []
        content {
            log_analytics_workspace_id = azurerm_log_analytics_workspace.test[0].id
        }
    }

    dynamic ingress_application_gateway {
        for_each = var.enable_agic ? ["Enabled"] : []
        content {
            gateway_name = "myagicservice"
            subnet_cidr = "10.2.0.0/16"
        }
    }

    network_profile {
        load_balancer_sku  = var.load_balancer_sku
        network_plugin     = var.network_plugin
        dns_service_ip     = var.network_plugin == "azure" ? "10.0.0.10" : null
        docker_bridge_cidr = var.network_plugin == "azure" ? "170.10.0.1/16" : null
        service_cidr       = var.network_plugin == "azure" ? "10.0.0.0/16" : null
    }

    tags = {
        Environment = "Case Testing"
    }
}

resource "azurerm_kubernetes_cluster_node_pool" "linux" {       
    lifecycle {
    ignore_changes = [
      tags
    ]
  }
    for_each = var.create_linux_user_nodepool ? var.linux_user_nodepool_map : {}

    name                  = each.key
    vm_size               = each.value.nodes_size
    node_count            = each.value.node_count      
    os_type               = "Linux"
    kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
    tags = { NodepoolType  = "User nodepool - Linux" }   
}

resource "azurerm_kubernetes_cluster_node_pool" "windows" {
    count = var.create_windows_user_nodepool ? 1 : 0
    name                  = "winusr"
    kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
    vm_size               = var.sku_windows_vm_size
    node_count            = var.windows_agent_count
    os_type = "Windows"

    tags = {
        Environment = "User Windows nodepool"
    }
}
