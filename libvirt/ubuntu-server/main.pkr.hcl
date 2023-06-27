packer {
  required_plugins {
    sshkey = {
      version = ">= 1.0.1"
      source = "github.com/ivoronin/sshkey"
    }
    libvirt = {
      version = ">= 0.5.0"
      source  = "github.com/thomasklein94/libvirt"
    }
  }
}

data "sshkey" "install" {
}

source "libvirt" "example" {
  libvirt_uri = "qemu:///system"

  vcpu   = 1
  memory = 846

  network_interface {
    type  = "managed"
    alias = "communicator"
  }

  # https://developer.hashicorp.com/packer/plugins/builders/libvirt#communicators-and-network-interfaces
  communicator {
    communicator         = "ssh"
    ssh_username         = "ubuntu"
    ssh_private_key_file = data.sshkey.install.private_key_path
  }
  network_address_source = "lease"

  volume {
    alias = "artifact"

    source {
      type     = "external"
      # With newer releases, the URL and the checksum can change.
      urls     = ["https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64-disk-kvm.img"]
      # checksum = "3b11d66d8211a8c48ed9a727b9a74180ac11cd8118d4f7f25fc7d1e4a148eddc"
    }

    capacity   = "10G"
    target_dev = "sda"
    bus        = "sata"
    format     = "qcow2"
  }

  volume {
    source {
      type = "cloud-init"
      user_data = format("#cloud-config\n%s", jsonencode({
        ssh_authorized_keys = [
          data.sshkey.install.public_key,
        ]
      }))

    }

    target_dev = "sdb"
    bus        = "sata"
  }
  shutdown_mode = "acpi"
}

build {
  sources = ["source.libvirt.example"]
  provisioner "shell" {
    inline = [
      "echo The domain has started and became accessible",
      "echo The domain has the following addresses",
      "ip -br a",
      "echo if you want to connect via SSH use the following key: ${data.sshkey.install.private_key_path}",
    ]
  }
  provisioner "breakpoint" {
    note = "You can examine the created domain with virt-manager, virsh or via SSH"
  }
}
