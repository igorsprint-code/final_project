data "yandex_compute_image" "ubuntu" {
  family = var.image
}


resource "yandex_compute_instance" "app_vm" {
  #depends_on  = [yandex_compute_instance.db]
  count       = var.app_vm_count
  name        = "${var.app_vm_name}_${count.index + 1}"
  platform_id = var.app_vm_platform
  hostname    = "${var.app_vm_host_name}-${count.index + 1}"
  resources {
    cores         = var.app_vms_resources["app_vm"].cores
    memory        = var.app_vms_resources["app_vm"].memory
    core_fraction = var.app_vms_resources["app_vm"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.app_vm_preemptible
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.project_subnet.id
    nat                = var.app_vm_nat
    security_group_ids = [yandex_vpc_security_group.project_sec_group.id]
  }

  metadata = merge(var.metadata, {
    ssh-keys = "ubuntu:${local.ssh_public}"
  })

}