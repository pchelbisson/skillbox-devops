terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
}

data "yandex_compute_image" "my-ubuntu-2004-1" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "my-vm-1" {
  name        = "test-vm-1"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${data.yandex_compute_image.my-ubuntu-2004-1.id}"
    }
  }

  network_interface {
    subnet_id = "e9b4iccnfrlf8opemjgc"
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}


output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.my-vm-1.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.my-vm-1.network_interface.0.nat_ip_address
}
