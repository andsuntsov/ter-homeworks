resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name        = each.value.vm_name
  hostname    = each.value.vm_name
  platform_id = "standard-v1"
  zone        = var.default_zone
  folder_id   = var.folder_id
  allow_stopping_for_update = true

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      image_id = "fd81radk00nmm2jpqh94"
      size     = each.value.disk_volume
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
