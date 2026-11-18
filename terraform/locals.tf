locals {
  ssh_public = file("~/.ssh/id_ed25519.pub")

  vm_metadata = {
    user-data = templatefile("${path.module}/cloud-init.yaml.tpl", {
      ssh_user = var.ssh_user_name
      ssh_key  = local.ssh_public
    })
  }

}