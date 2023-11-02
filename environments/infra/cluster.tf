module "cluster" {
  source                  = "../../modules/rke2/cluster"
  master_nodes_ips        = ["10.34.104.58", "10.34.104.59", "10.34.104.60"]
  remote_sudoer           = "catastrophe"
  rke2_version            = "v1.28.2+rke2r1"
  rke2_ha_mode            = "true"
  rke2_ha_mode_keepalived = "false"
  rke2_ha_mode_kubevip    = "true"
  rke2_api_ip             = "10.34.104.58"
  rke2_download_kubeconf  = "true"
  rke2_additional_sans    = ["infra-arus.trupt.com.tr"]
}