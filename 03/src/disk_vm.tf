# Создание 3 одинаковых дисков по 1 Гб
resource "yandex_compute_disk" "storage_disks" {
  count = 3
  name  = "disk-${count.index + 1}"
  type  = "network-hdd"
  zone  = var.default_zone
  size  = 1
}

# Создание ВМ storage с динамическим подключением дисков
resource "yandex_compute_instance" "storage" {
  name        = "storage"
  hostname    = "storage"
  platform_id = "standard-v1"
  zone        = var.default_zone
  depends_on = [yandex_compute_instance.web]

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = 10
    }
  }

  # Динамическое подключение дополнительных дисков
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disks
    content {
      disk_id = secondary_disk.value.id
    }
  }

  network_interface {
    subnet_id          = data.yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

  scheduling_policy {
    preemptible = true
  }
}
