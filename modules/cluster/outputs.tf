output "cluster_id" {
  value = rancher2_cluster_v2.cluster_rke2.cluster_registration_token.*.cluster_id
}

output "cluster_name" {
  value = rancher2_cluster_v2.cluster_rke2.name
}

output "cluster_node_command" {
  value = rancher2_cluster_v2.cluster_rke2.cluster_registration_token.*.node_command
}