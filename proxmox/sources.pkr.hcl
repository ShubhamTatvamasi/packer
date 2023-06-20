source "proxmox-iso" "ubuntu-desktop" {

  boot_wait = "15s"

  boot_command = [
    "<enter><wait30>",
    "<tab><tab><enter><wait10>",
    "<tab><tab><tab><tab><tab><tab><tab><enter><wait10>",
    "<tab><tab><tab><tab><tab><enter><wait10>",
    "<tab><tab><tab><tab><enter><wait10>",
    "<tab><enter><wait20>",
    "<tab><tab><tab><enter><wait10>",
    "${var.desktop_username}<tab><tab><tab>",
    "${var.desktop_password}<tab>",
    "${var.desktop_password}<tab><tab><tab><enter>",
    "<wait4m30s>", // Wait time for Installation to finish.
    "<tab><enter><wait10>",
    "<enter><wait30>", // Reboot
    "<enter><wait5>${var.desktop_password}<enter><wait20>",
    "<leftSuper>terminal<enter><wait10>",
    "sudo apt install -y qemu-guest-agent",
    "<enter><wait5>${var.desktop_password}<enter><wait20>",
    "sudo systemctl start qemu-guest-agent",
    "<enter>",
  ]

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

  template_name        = "${var.template_name}"
  template_description = "${var.template_description}, generated on ${timestamp()}"

  communicator = "none"

}
