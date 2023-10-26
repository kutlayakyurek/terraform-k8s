terraform {
  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = "3.2.0"
    }
  }
}

resource "rancher2_cluster_v2" "cluster_rke2" {
  name        = "rke-${var.stack}"
  description = "rke-${var.stack}"
  rke_config {
    ignore_docker_version = false
    network {
      plugin = "canal"
    }
  }
  kubernetes_version = ""
}