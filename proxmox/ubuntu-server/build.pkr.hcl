build {
  sources = ["source.proxmox-iso.ubuntu-server"]

  provisioner "shell" {
    inline = [
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
      "sudo truncate -s 0 /etc/machine-id",
      "sudo sync"
    ]
  }
}
