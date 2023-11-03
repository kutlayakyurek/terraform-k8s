resource "local_file" "ansible_config" {

  content = templatefile("${path.module}/ansible/ansible.tpl",
    {
      remote_sudoer = var.remote_sudoer
    })
  filename = "${path.module}/ansible/ansible.cfg"
}

resource "local_file" "ansible_inventory" {

  content = templatefile("${path.module}/ansible/inventory.tpl",
    {
      master_nodes_ips        = var.master_nodes_ips
      rke2_servers_group_name = var.rke2_servers_group_name
      rke2_cluster_group_name = var.rke2_cluster_group_name
    })
  filename = "${path.module}/ansible/inventory"
}

resource "local_file" "ansible_playbook" {

  content = templatefile("${path.module}/ansible/playbook.tpl",
    {
      rke2_type                            = var.rke2_type
      rke2_ha_mode                         = var.rke2_ha_mode
      rke2_ha_mode_keepalived              = var.rke2_ha_mode_keepalived
      rke2_ha_mode_kubevip                 = var.rke2_ha_mode_kubevip
      rke2_api_ip                          = var.rke2_api_ip
      rke2_loadbalancer_ip_range           = var.rke2_loadbalancer_ip_range
      rke2_kubevip_cloud_provider_enable   = var.rke2_kubevip_cloud_provider_enable
      rke2_kubevip_svc_enable              = var.rke2_kubevip_svc_enable
      rke2_additional_sans                 = var.rke2_additional_sans
      rke2_apiserver_dest_port             = var.rke2_apiserver_dest_port
      rke2_server_node_taints              = var.rke2_server_node_taints
      rke2_agent_node_taints               = var.rke2_agent_node_taints
      rke2_token                           = var.rke2_token
      rke2_version                         = var.rke2_version
      rke2_channel_url                     = var.rke2_channel_url
      rke2_install_bash_url                = var.rke2_install_bash_url
      rke2_data_path                       = var.rke2_data_path
      rke2_artifact_url                    = var.rke2_artifact_url
      rke2_artifact_path                   = var.rke2_artifact_path
      rke2_artifact                        = var.rke2_artifact
      rke2_airgap_mode                     = var.rke2_airgap_mode
      rke2_airgap_implementation           = var.rke2_airgap_implementation
      rke2_airgap_copy_sourcepath          = var.rke2_airgap_copy_sourcepath
      rke2_airgap_copy_additional_tarballs = var.rke2_airgap_copy_additional_tarballs
      rke2_tarball_images_path             = var.rke2_tarball_images_path
      rke2_architecture                    = var.rke2_architecture
      rke2_install_script_dir              = var.rke2_install_script_dir
      rke2_channel                         = var.rke2_channel
      rke2_disable                         = var.rke2_disable
      disable_kube_proxy                   = var.disable_kube_proxy
      rke2_custom_manifests                = var.rke2_custom_manifests
      rke2_static_pods                     = var.rke2_static_pods
      rke2_custom_registry_mirrors         = var.rke2_custom_registry_mirrors
      rke2_custom_registry_configs         = var.rke2_custom_registry_configs
      rke2_custom_registry_path            = var.rke2_custom_registry_path
      rke2_config                          = var.rke2_config
      rke2_etcd_snapshot_source_dir        = var.rke2_etcd_snapshot_source_dir
      rke2_etcd_snapshot_file              = var.rke2_etcd_snapshot_file
      rke2_etcd_snapshot_destination_dir   = var.rke2_etcd_snapshot_destination_dir
      rke2_snapshooter                     = var.rke2_snapshooter
      rke2_cni                             = var.rke2_cni
      rke2_download_kubeconf               = var.rke2_download_kubeconf
      rke2_download_kubeconf_file_name     = var.rke2_download_kubeconf_file_name
      rke2_download_kubeconf_path          = var.rke2_download_kubeconf_path
      rke2_cluster_group_name              = var.rke2_cluster_group_name
      rke2_servers_group_name              = var.rke2_servers_group_name
      rke2_agents_group_name               = var.rke2_agents_group_name
      rke2_server_options                  = var.rke2_server_options
      rke2_drain_node_during_upgrade       = var.rke2_drain_node_during_upgrade
      rke2_wait_for_all_pods_to_be_ready   = var.rke2_wait_for_all_pods_to_be_ready
      master_nodes_ips                     = var.master_nodes_ips
      worker_nodes_ips                     = var.worker_nodes_ips
      remote_sudoer                        = var.remote_sudoer
    })
  filename = "${path.module}/ansible/playbook.yml"

  provisioner "local-exec" {
    working_dir = "${path.module}/ansible"
    command     = "ansible-playbook -i inventory playbook.yml"
  }

}