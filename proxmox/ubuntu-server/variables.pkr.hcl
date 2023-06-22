variable "password" {
  type = string
}

variable "proxmox_url" {
  type = string
}

variable "http_bind_address" {
  type = string
}

variable "username" {
  type    = string
  default = "root@pam"
}

variable "node" {
  type    = string
  default = "pve"
}

variable "iso_file" {
  type    = string
  default = "ubuntu-22.04.2-live-server-amd64.iso"
}

variable "template_name" {
  type    = string
  default = "ubuntu-server-22-04-2"
}

variable "template_description" {
  type    = string
  default = "Ubuntu Server 22.04.2 LTS"
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

variable "ssh_password" {
  type    = string
  default = "ubuntu"
}

variable "memory" {
  type    = number
  default = 2048
}

variable "cores" {
  type    = number
  default = 2
}

variable "cpu_type" {
  type    = string
  default = "host"
}

variable "os" {
  type    = string
  default = "l26"
}

variable "disk_size" {
  type    = string
  default = "20G"
}
