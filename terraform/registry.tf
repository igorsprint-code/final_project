resource "yandex_container_registry" "yc_registry" {
  name        = var.registry_name
  folder_id   = var.folder_id
}

resource "yandex_container_registry_iam_binding" "public_access" {
  registry_id = yandex_container_registry.yc_registry.id
  role        = "container-registry.images.puller"
  members     = ["system:allUsers"]
}