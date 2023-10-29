- name: Deploy Cluster
  hosts: k8s_cluster
  become: yes
  vars:
    %{~ if rke2_type != "" ~}
    rke2_type: ${rke2_type}
    %{~ endif ~}
    %{~ if rke2_ha_mode != "" ~}
    rke2_ha_mode: ${rke2_ha_mode}
    %{~ endif ~}
    %{~ if rke2_ha_mode_keepalived != "" ~}
    rke2_ha_mode_keepalived: ${rke2_ha_mode_keepalived}
    %{~ endif ~}
    %{~ if rke2_ha_mode_kubevip != "" ~}
    rke2_ha_mode_kubevip: ${rke2_ha_mode_kubevip}
    %{~ endif ~}
    %{~ if rke2_api_ip != "" ~}
    rke2_api_ip: ${rke2_api_ip}
    %{~ endif ~}
    %{~ if rke2_loadbalancer_ip_range != "" ~}
    rke2_loadbalancer_ip_range: ${rke2_loadbalancer_ip_range}
    %{~ endif ~}
    %{~ if rke2_kubevip_cloud_provider_enable != "" ~}
    rke2_kubevip_cloud_provider_enable: ${rke2_kubevip_cloud_provider_enable}
    %{~ endif ~}
    %{~ if rke2_kubevip_svc_enable != "" ~}
    rke2_kubevip_svc_enable: ${rke2_kubevip_svc_enable}
    %{~ endif ~}
    %{~ if length(rke2_additional_sans) > 0 ~}
    rke2_additional_sans:
    %{~ for domain in rke2_additional_sans ~}
      - ${domain}
    %{~ endfor ~}
    %{~ endif ~}
    %{~ if rke2_apiserver_dest_port != "" ~}
    rke2_apiserver_dest_port: ${rke2_apiserver_dest_port}
    %{~ endif ~}
    %{~ if rke2_server_node_taints != "" ~}
    rke2_server_node_taints: ${rke2_server_node_taints}
    %{~ endif ~}
    %{~ if rke2_agent_node_taints != "" ~}
    rke2_agent_node_taints: ${rke2_agent_node_taints}
    %{~ endif ~}
    %{~ if rke2_token != "" ~}
    rke2_token: ${rke2_token}
    %{~ endif ~}
    %{~ if rke2_version != "" ~}
    rke2_version: ${rke2_version}
    %{~ endif ~}
    %{~ if rke2_channel_url != "" ~}
    rke2_channel_url: ${rke2_channel_url}
    %{~ endif ~}
    %{~ if rke2_install_bash_url != "" ~}
    rke2_install_bash_url: ${rke2_install_bash_url}
    %{~ endif ~}
    %{~ if rke2_data_path != "" ~}
    rke2_data_path: ${rke2_data_path}
    %{~ endif ~}
    %{~ if rke2_artifact_url != "" ~}
    rke2_artifact_url: ${rke2_artifact_url}
    %{~ endif ~}
    %{~ if rke2_artifact_path != "" ~}
    rke2_artifact_path: ${rke2_artifact_path}
    %{~ endif ~}
    %{~ if rke2_artifact != "" ~}
    rke2_artifact: ${rke2_artifact}
    %{~ endif ~}
    %{~ if rke2_airgap_mode != "" ~}
    rke2_airgap_mode: ${rke2_airgap_mode}
    %{~ endif ~}
    %{~ if rke2_airgap_implementation != "" ~}
    rke2_airgap_implementation: ${rke2_airgap_implementation}
    %{~ endif ~}
    %{~ if rke2_airgap_copy_sourcepath != "" ~}
    rke2_airgap_copy_sourcepath: ${rke2_airgap_copy_sourcepath}
    %{~ endif ~}
    %{~ if rke2_airgap_copy_additional_tarballs != "" ~}
    rke2_airgap_copy_additional_tarballs: ${rke2_airgap_copy_additional_tarballs}
    %{~ endif ~}
    %{~ if rke2_tarball_images_path != "" ~}
    rke2_tarball_images_path: ${rke2_tarball_images_path}
    %{~ endif ~}
    %{~ if rke2_architecture != "" ~}
    rke2_architecture: ${rke2_architecture}
    %{~ endif ~}
    %{~ if rke2_install_script_dir != "" ~}
    rke2_install_script_dir: ${rke2_install_script_dir}
    %{~ endif ~}
    %{~ if rke2_channel != "" ~}
    rke2_channel: ${rke2_channel}
    %{~ endif ~}
    %{~ if rke2_disable != "" ~}
    rke2_disable: ${rke2_disable}
    %{~ endif ~}
    %{~ if disable_kube_proxy != "" ~}
    disable_kube_proxy: ${disable_kube_proxy}
    %{~ endif ~}
    %{~ if rke2_custom_manifests != "" ~}
    rke2_custom_manifests: ${rke2_custom_manifests}
    %{~ endif ~}
    %{~ if rke2_static_pods != "" ~}
    rke2_static_pods: ${rke2_static_pods}
    %{~ endif ~}
    %{~ if rke2_custom_registry_mirrors != "" ~}
    rke2_custom_registry_mirrors: ${rke2_custom_registry_mirrors}
    %{~ endif ~}
    %{~ if rke2_custom_registry_configs != "" ~}
    rke2_custom_registry_configs: ${rke2_custom_registry_configs}
    %{~ endif ~}
    %{~ if rke2_custom_registry_path != "" ~}
    rke2_custom_registry_path: ${rke2_custom_registry_path}
    %{~ endif ~}
    %{~ if rke2_config != "" ~}
    rke2_config: ${rke2_config}
    %{~ endif ~}
    %{~ if rke2_etcd_snapshot_source_dir != "" ~}
    rke2_etcd_snapshot_source_dir: ${rke2_etcd_snapshot_source_dir}
    %{~ endif ~}
    %{~ if rke2_etcd_snapshot_file != "" ~}
    rke2_etcd_snapshot_file: ${rke2_etcd_snapshot_file}
    %{~ endif ~}
    %{~ if rke2_etcd_snapshot_destination_dir != "" ~}
    rke2_etcd_snapshot_destination_dir: ${rke2_etcd_snapshot_destination_dir}
    %{~ endif ~}
    %{~ if rke2_snapshooter != "" ~}
    rke2_snapshooter: ${rke2_snapshooter}
    %{~ endif ~}
    %{~ if rke2_cni != "" ~}
    rke2_cni: ${rke2_cni}
    %{~ endif ~}
    %{~ if rke2_download_kubeconf != "" ~}
    rke2_download_kubeconf: ${rke2_download_kubeconf}
    %{~ endif ~}
    %{~ if rke2_download_kubeconf_file_name != "" ~}
    rke2_download_kubeconf_file_name: ${rke2_download_kubeconf_file_name}
    %{~ endif ~}
    %{~ if rke2_download_kubeconf_path != "" ~}
    rke2_download_kubeconf_path: ${rke2_download_kubeconf_path}
    %{~ endif ~}
    %{~ if rke2_cluster_group_name != "" ~}
    rke2_cluster_group_name: ${rke2_cluster_group_name}
    %{~ endif ~}
    %{~ if rke2_servers_group_name != "" ~}
    rke2_servers_group_name: ${rke2_servers_group_name}
    %{~ endif ~}
    %{~ if rke2_agents_group_name != "" ~}
    rke2_agents_group_name: ${rke2_agents_group_name}
    %{~ endif ~}
    %{~ if rke2_drain_node_during_upgrade != "" ~}
    rke2_drain_node_during_upgrade: ${rke2_drain_node_during_upgrade}
    %{~ endif ~}
    %{~ if rke2_wait_for_all_pods_to_be_ready != "" ~}
    rke2_wait_for_all_pods_to_be_ready: ${rke2_wait_for_all_pods_to_be_ready}
    %{~ endif ~}
  roles:
    - role: lablabs.rke2