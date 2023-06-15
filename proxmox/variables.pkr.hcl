variable "password" {}

variable "username" {
  type    = string
  default = "root@pam"
}

variable "proxmox_url" {
  type    = string
  default = "https://192.168.1.201:8006/api2/json"
}

variable "node" {
  type    = string
  default = "pve"
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
  default = 4
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
  default = "25G"
}
