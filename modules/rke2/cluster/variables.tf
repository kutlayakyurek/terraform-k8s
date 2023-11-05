# The node type - server or agent
variable "rke2_type" {
  type    = string
  default = ""
}

# Deploy the control plane in HA mode
variable rke2_ha_mode {
  type    = string
  default = ""
}

# Install and configure Keepalived on Server nodes
# Can be disabled if you are using pre-configured Load Balancer
variable "rke2_ha_mode_keepalived" {
  type    = string
  default = ""
}

# Install and configure kube-vip LB and VIP for cluster
# rke2_ha_mode_keepalived needs to be false
variable "rke2_ha_mode_kubevip" {
  type    = string
  default = ""
}

# Kubernetes API and RKE2 registration IP address. The default Address is the IPv4 of the Server/Master node.
# In HA mode choose a static IP which will be set as VIP in keepalived.
# Or if the keepalived is disabled, use IP address of your LB.
variable "rke2_api_ip" {
  type    = string
  default = ""
}

# optional option for RKE2 Server to listen on a private IP address on port 9345
variable rke2_api_private_ip {
  type    = string
  default = ""
}

# kubevip load balancer IP range
variable "rke2_loadbalancer_ip_range" {
  type    = string
  default = ""
}

# Install kubevip cloud provider if rke2_ha_mode_kubevip is true
variable "rke2_kubevip_cloud_provider_enable" {
  type    = string
  default = ""
}

# Enable kube-vip to watch Services of type LoadBalancer
variable "rke2_kubevip_svc_enable" {
  type    = string
  default = ""
}

# Add additional SANs in k8s API TLS cert
variable "rke2_additional_sans" {
  type    = list(string)
  default = []
}

# API Server destination port
variable "rke2_apiserver_dest_port" {
  type    = string
  default = ""
}

# Server nodes taints
variable "rke2_server_node_taints" {
  type    = string
  default = ""
}

# Agent nodes taints
variable "rke2_agent_node_taints" {
  type    = string
  default = ""
}

# Pre-shared secret token that other server or agent nodes will register with when connecting to the cluster
variable "rke2_token" {
  type    = string
  default = ""
}

# RKE2 version
variable rke2_version {
  type    = string
  default = ""
}

# URL to RKE2 repository
variable "rke2_channel_url" {
  type    = string
  default = ""
}

# URL to RKE2 install bash script
# e.g. rancher chinase mirror http://rancher-mirror.rancher.cn/rke2/install.sh
variable "rke2_install_bash_url" {
  type    = string
  default = ""
}

# Local data directory for RKE2
variable "rke2_data_path" {
  type    = string
  default = ""
}

# Default URL to fetch artifacts
variable "rke2_artifact_url" {
  type    = string
  default = ""
}

# Local path to store artifacts
variable "rke2_artifact_path" {
  type    = string
  default = ""
}

# Airgap required artifacts
variable "rke2_artifact" {
  type    = string
  default = ""
}

# Changes the deploy strategy to install based on local artifacts
variable "rke2_airgap_mode" {
  type    = string
  default = ""
}

# Airgap implementation type - download, copy or exists
# - 'download' will fetch the artifacts on each node,
# - 'copy' will transfer local files in 'rke2_artifact' to the nodes,
# - 'exists' assumes 'rke2_artifact' files are already stored in 'rke2_artifact_path'
variable "rke2_airgap_implementation" {
  type    = string
  default = ""
}

# Local source path where artifacts are stored
variable "rke2_airgap_copy_sourcepath" {
  type    = string
  default = ""
}

# Tarball images for additional components to be copied from rke2_airgap_copy_sourcepath to the nodes
# (File extensions in the list and on the real files must be retained)
variable "rke2_airgap_copy_additional_tarballs" {
  type    = string
  default = ""
}

# Destination for airgap additional images tarballs ( see https://docs.rke2.io/install/airgap/#tarball-method )
variable "rke2_tarball_images_path" {
  type    = string
  default = ""
}

# Architecture to be downloaded, currently there are releases for amd64 and s390x
variable "rke2_architecture" {
  type    = string
  default = ""
}

# Destination directory for RKE2 installation script
variable "rke2_install_script_dir" {
  type    = string
  default = ""
}

# RKE2 channel
variable "rke2_channel" {
  type    = string
  default = ""
}

# Do not deploy packaged components and delete any deployed components
# Valid items: rke2-canal, rke2-coredns, rke2-ingress-nginx, rke2-metrics-server
variable "rke2_disable" {
  type    = string
  default = ""
}

# Option to disable kube-proxy
variable "disable_kube_proxy" {
  type    = string
  default = ""
}

# Path to custom manifests deployed during the RKE2 installation
# It is possible to use Jinja2 templating in the manifests
variable "rke2_custom_manifests" {
  type    = string
  default = ""
}

# Path to static pods deployed during the RKE2 installation
variable "rke2_static_pods" {
  type    = string
  default = ""
}

# Configure custom Containerd Registry
# - name:
#   endpoint: {}
#   rewrite: '"^rancher/(.*)": "mirrorproject/rancher-images/$1"'
variable "rke2_custom_registry_mirrors" {
  type = list(object({
    name     = string
    endpoint = string
  }))
  default = []
}

# Configure custom Containerd Registry additional configuration
#   - endpoint:
#     config:
variable "rke2_custom_registry_configs" {
  type    = string
  default = ""
}

# Path to Container registry config file template
variable "rke2_custom_registry_path" {
  type    = string
  default = ""
}

# Path to RKE2 config file template
variable "rke2_config" {
  type    = string
  default = ""
}

# Etcd snapshot source directory
variable "rke2_etcd_snapshot_source_dir" {
  type    = string
  default = ""
}

# Etcd snapshot file name.
# When the file name is defined, the etcd will be restored on initial deployment Ansible run.
# The etcd will be restored only during the initial run, so even if you will leave the the file name specified,
# the etcd will remain untouched during the next runs.
# You can either use this or set options in `rke2_etcd_snapshot_s3_options`
variable "rke2_etcd_snapshot_file" {
  type    = string
  default = ""
}

# Etcd snapshot location
variable "rke2_etcd_snapshot_destination_dir" {
  type    = string
  default = ""
}

# rke2_etcd_snapshot_s3_options:
# s3_endpoint: "" # required
# access_key: "" # required
# secret_key: "" # required
# bucket: "" # required
# snapshot_name: "" # required.
# skip_ssl_verify: false # optional
# endpoint_ca: "" # optional. Can skip if using defaults
# region: "" # optional - defaults to us-east-1
# folder: "" # optional - defaults to top level of bucket
# Override default containerd snapshotter
variable "rke2_snapshooter" {
  type    = string
  default = ""
}

# Deploy RKE2 with default CNI canal
variable "rke2_cni" {
  type    = string
  default = ""
}

# Validate system configuration against the selected benchmark
# (Supported value is "cis-1.23" or eventually "cis-1.6" if you are running RKE2 prior 1.25)
variable "rke2_cis_profile" {
  type    = string
  default = ""
}

# Download Kubernetes config file to the Ansible controller
variable "rke2_download_kubeconf" {
  type    = string
  default = ""
}

# Name of the Kubernetes config file will be downloaded to the Ansible controller
variable "rke2_download_kubeconf_file_name" {
  type    = string
  default = ""
}

# Destination directory where the Kubernetes config file will be downloaded to the Ansible controller
variable "rke2_download_kubeconf_path" {
  type    = string
  default = ""
}

# Default Ansible Inventory Group name for RKE2 cluster
variable "rke2_cluster_group_name" {
  type    = string
  default = "k8s_cluster"
}

# Default Ansible Inventory Group name for RKE2 Servers
variable "rke2_servers_group_name" {
  type    = string
  default = "masters"
}

# Default Ansible Inventory Group name for RKE2 Agents
variable "rke2_agents_group_name" {
  type    = string
  default = "workers"
}

# (Optional) Additional RKE2 server configuration options
# You could find the flags at https://docs.rke2.io/install/install_options/install_options/#configuring-rke2-server-nodes
variable "rke2_server_options" {
  type    = list(string)
  default = []
}

# Cordon, drain the node which is being upgraded. Uncordon the node once the RKE2 upgraded
variable "rke2_drain_node_during_upgrade" {
  type    = string
  default = ""
}

# Wait for all pods to be ready after rke2-service restart during rolling restart.
variable "rke2_wait_for_all_pods_to_be_ready" {
  type    = string
  default = ""
}

# Master node ip list
variable master_nodes_ips {
  type = list(string)
}

# Worker node ip list
variable worker_nodes_ips {
  type    = list(string)
  default = []
}

# Remote user to be used by Ansible
variable remote_sudoer {
  default = "centos"
}