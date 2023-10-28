[${rke2_servers_group_name}]
%{ for master_nodes_ip in master_nodes_ips ~}
${master_nodes_ip}
%{ endfor ~}

[${rke2_cluster_group_name}:children]
${rke2_servers_group_name}