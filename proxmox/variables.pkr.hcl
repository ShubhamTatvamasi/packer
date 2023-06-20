variable "password" {
  type = string
}

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

variable "iso_file" {
  type    = string
  default = "ubuntu-22.04.2-desktop-amd64.iso"
}

variable "desktop_username" {
  type    = string
  default = "ubuntu"
}

variable "desktop_password" {
  type    = string
  default = "ubuntu"
}

variable "memory" {
  type    = number
  default = 4096
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
  default = "50G"
}
