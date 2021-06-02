output "client_key" {
    description = "Client Key"
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_key
}

output "client_certificate" {
    description = "Client Certificate"
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
    description = "CLuster CA Certificate"
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate
}

output "cluster_username" {
    description = "Cluster User Name"
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.username
}

output "cluster_password" {
    description = "Cluster Password"
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.password
}

output "kube_config" {
    sensitive = true
    value = azurerm_kubernetes_cluster.k8s.kube_config_raw
    description = "Kube Config - raw"
}

output "host" {
    description = "Host"
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.host
}