build {
  sources = ["source.proxmox-iso.ubuntu-server"]

  provisioner "shell" {
    inline = [
      "sudo truncate -s 0 /etc/machine-id"
    ]
  }
}
