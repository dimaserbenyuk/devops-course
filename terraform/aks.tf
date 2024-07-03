resource "azurerm_resource_group" "rg-aks" {
  name     = "serbeniuk-aks"
  location = "centralus"
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks"
  kubernetes_version  = "1.29"
  location            = azurerm_resource_group.rg-aks.location
  resource_group_name = azurerm_resource_group.rg-aks.name
  dns_prefix          = "exampleaks"


  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}

resource "helm_release" "external_nginx" {
  name = "external"

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress"
  create_namespace = true
  version          = "4.8.0"

  values = [file("${path.module}/values/ingress.yaml")]
}

resource "helm_release" "cert_manager" {
  name = "cert-manager"

  version          = "v1.15.0"
  chart            = "jetstack/cert-manager"
  namespace        = "cert-manager"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}
