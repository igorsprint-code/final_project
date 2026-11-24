
resource "yandex_mdb_mysql_database" "app_db" {
  cluster_id = yandex_mdb_mysql_cluster.project_cluster.id
  name       = var.db_name
}

resource "yandex_mdb_mysql_cluster" "project_cluster" {
  name        = var.cluster_name
  environment = var.cluster_env
  network_id  = yandex_vpc_network.project_network.id
  version     = var.cluster_version

  resources {
    resource_preset_id = var.cluster_resource_preset
    disk_type_id       = var.cluster_disk_type
    disk_size          = var.cluster_disk_size
  }

  host {
    zone      = var.cluster_zone
    subnet_id = yandex_vpc_subnet.project_subnet.id
    name = var.db_host_name
  }
}


resource "yandex_mdb_mysql_user" "app_user" {
  cluster_id = yandex_mdb_mysql_cluster.project_cluster.id
  name       = var.db_user
  password   = var.db_password

  permission {
    database_name = yandex_mdb_mysql_database.app_db.name
    roles         = var.roles
  }



  global_permissions = var.global_permissions

  authentication_plugin = var.authentication_plugin
}