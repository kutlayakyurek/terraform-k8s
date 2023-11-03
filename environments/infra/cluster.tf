module "cluster" {
  source                     = "../../modules/rke2/cluster"
  master_nodes_ips           = ["10.34.104.58", "10.34.104.59", "10.34.104.60"]
  remote_sudoer              = "catastrophe"
  rke2_version               = "v1.28.2+rke2r1"
  rke2_ha_mode               = "true"
  rke2_ha_mode_keepalived    = "false"
  rke2_ha_mode_kubevip       = "true"
  rke2_api_ip                = "10.41.1.1"
  rke2_download_kubeconf     = "true"
  rke2_additional_sans       = ["infra-arus.trupt.com.tr"]
  rke2_server_options        = ["cluster-cidr: '10.42.0.0/16'", "service-cidr: '10.43.0.0/16'"]
  rke2_loadbalancer_ip_range = "10.41.1.1-10.41.1.255"
}