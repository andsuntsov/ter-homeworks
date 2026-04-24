resource "yandex_compute_instance" "web" {
  depends_on = [yandex_compute_instance.db]
  count      = 2

  name        = "web-${count.index + 1}"
  hostname    = "web-${count.index + 1}"
  platform_id = "standard-v1"
  zone        = var.default_zone
  folder_id   = var.folder_id

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81radk00nmm2jpqh94"
      size     = 10
    }
  }

  network_interface {
    subnet_id          = data.yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_key}"
  }
}
