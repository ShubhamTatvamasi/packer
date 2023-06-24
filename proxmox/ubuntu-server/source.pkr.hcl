source "proxmox-iso" "ubuntu-server" {

  boot_command = [
    "c",
    "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/'",
    "<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>"
  ]

  http_directory    = "http"
  http_bind_address = "${var.http_bind_address}"

  insecure_skip_tls_verify = true

  iso_file    = "local:iso/${var.iso_file}"
  unmount_iso = true

  network_adapters {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disks {
    disk_size    = "${var.disk_size}"
    storage_pool = "local-lvm"
  }

  memory   = "${var.memory}"
  cores    = "${var.cores}"
  cpu_type = "${var.cpu_type}"
  os       = "${var.os}"

  proxmox_url = "${var.proxmox_url}"
  node        = "${var.node}"
  username    = "${var.username}"
  password    = "${var.password}"

  ssh_username = "${var.ssh_username}"
  ssh_password = "${var.ssh_password}"
  ssh_timeout  = "20m"

  template_name        = "${var.template_name}"
  template_description = "${var.template_description}, generated on ${timestamp()}"

}
