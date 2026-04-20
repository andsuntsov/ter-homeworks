output "vm_web_info" {
  description = "Параметры WEB VM: имя, внешний IP, fqdn"
  value = {
    name        = yandex_compute_instance.platform.name
    external_ip = yandex_compute_instance.platform.network_interface[0].nat_ip_address
    fqdn        = yandex_compute_instance.platform.fqdn
  }
}

output "vm_db_info" {
  description = "Параметры DB VM: имя, внешний IP, fqdn"
  value = {
    name        = yandex_compute_instance.platform_db.name
    external_ip = yandex_compute_instance.platform_db.network_interface[0].nat_ip_address
    fqdn        = yandex_compute_instance.platform_db.fqdn
  }
}
