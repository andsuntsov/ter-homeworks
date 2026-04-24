data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}
data "yandex_vpc_network" "develop" {
  name = "develop"
}
data "yandex_vpc_subnet" "develop" {
  name = "develop"
}
