module "cluster" {
  source                       = "../../modules/rke2/cluster"
  master_nodes_ips             = ["10.34.104.55", "10.34.104.56", "10.34.104.57"]
  remote_sudoer                = "catastrophe"
  rke2_version                 = "v1.28.2+rke2r1"
  rke2_ha_mode                 = "true"
  rke2_ha_mode_kubevip         = "true"
  rke2_ha_mode_keepalived      = "false"
  rke2_api_ip                  = "10.34.104.149"
  rke2_download_kubeconf       = "true"
  rke2_additional_sans         = ["infra-arus.trupt.com.tr"]
  rke2_server_options          = ["cluster-cidr: 10.190.0.0/16", "service-cidr: 10.191.0.0/16"]
  rke2_loadbalancer_ip_range   = "range-global: 10.34.104.150-10.34.104.200"
  rke2_disable                 = "rke2-ingress-nginx"
  rke2_custom_registry_mirrors = [
    {
      name     = "docker.io"
      endpoint = "http://nexus-arus.trupt.com.tr:8083"
    }
  ]
}