module "cluster" {
  source                     = "../../modules/rke2/cluster"
  master_nodes_ips           = ["10.34.104.58", "10.34.104.59", "10.34.104.60"]
  remote_sudoer              = "catastrophe"
  rke2_version               = "v1.28.2+rke2r1"
  rke2_ha_mode               = "true"
  rke2_ha_mode_kubevip       = "true"
  rke2_api_ip                = "172.22.0.1"
  rke2_download_kubeconf     = "true"
  rke2_additional_sans       = ["infra-arus.trupt.com.tr"]
  rke2_server_options        = ["cluster-cidr: 172.20.0.0/16", "service-cidr: 172.21.0.0/16"]
  rke2_loadbalancer_ip_range = "cidr-global: 172.22.0.0/22"
  rke2_disable               = ["rke2-ingress-nginx"]
}