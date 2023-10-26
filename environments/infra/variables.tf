variable "RANCHER_URL" {
}

variable "RANCHER_ACCESSKEY" {
}

variable "RANCHER_SECRETKEY" {
}

variable "cluster_nodes_ips" {
  type    = list(any)
  default = ["10.34.104.58", "10.34.104.59", "10.34.104.60"]
}

variable "remote_sudoer" {
  default = "centos"
}

variable "private_key_file" {
  default = "../../../secrets/id_rsa"
}