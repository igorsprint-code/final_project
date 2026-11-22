locals {
  ssh_public = file("~/.ssh/id_ed25519.pub")

  vm_metadata = {
    user-data = templatefile("${path.module}/cloud-init.yaml.tpl", {
      ssh_user = var.ssh_user_name
      ssh_key  = local.ssh_public
      db_user = var.db_user
      db_password = var.db_password
      db_name = var.db_name
      db_host = yandex_mdb_mysql_cluster.project_cluster.host[0].fqdn
    })
  }

}