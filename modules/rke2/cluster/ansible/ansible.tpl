[defaults]
inventory = ./inventory
remote_user = ${remote_sudoer}
host_key_checking = False
remote_tmp = /tmp/ansible
display_ok_hosts = no

[ssh_connection]
ssh_args = -o ServerAliveInterval=200