resource "yandex_vpc_network" "project_network" {
  name = var.vpc_name
}


resource "yandex_vpc_subnet" "project_subnet" {
  name           = "${var.vpc_name}_${var.subnet_zone}"
  v4_cidr_blocks = var.cidr
  zone           = var.subnet_zone
  network_id     = yandex_vpc_network.project_network.id
}