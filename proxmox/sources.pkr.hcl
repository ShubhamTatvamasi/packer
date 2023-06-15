source "proxmox-iso" "ubuntu-desktop" {
  # boot_command = ["<up><tab> ip=dhcp inst.cmdline inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter>"]

  boot_command = [
    "<esc><wait>",
    "e<wait>",
    "<down><down><down><end>",
    "<bs><bs><bs><bs><wait>",
    "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
    "<f10><wait>"
  ]

  # http_directory           = "config"
  insecure_skip_tls_verify = true
  iso_file                 = "local:iso/ubuntu-22.04.2-desktop-amd64.iso"

  # network_adapters {
  #   bridge = "vmbr0"
  #   model  = "virtio"
  # }

  disks {
    disk_size         = "${var.disk_size}"
    storage_pool      = "local-lvm"
  }

  memory   = "${var.memory}"
  cores    = "${var.cores}"
  cpu_type = "${var.cpu_type}"
  os       = "${var.os}"

  node         = "${var.node}"
  password     = "${var.password}"
  proxmox_url  = "${var.proxmox_url}"
  ssh_username = "${var.ssh_username}"
  ssh_password = "${var.ssh_password}"
  # ssh_timeout          = "15m"
  # template_description = "Ubuntu 29-1.2, generated on ${timestamp()}"
  # template_name        = "ubuntu-29"
  unmount_iso = true
  username    = "${var.username}"
}
