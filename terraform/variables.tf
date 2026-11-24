###cloud vars

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}


### vpc vars

variable "vpc_name" {
  type    = string
  default = "project_network"
}

variable "cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "subnet_zone" {
  type    = string
  default = "ru-central1-a"
}


### app vms vars


variable "image" {
  type    = string
  default = "ubuntu-2204-lts"
}


variable "app_vm_count" {
  type    = number
  default = 1
}

variable "app_vm_name" {
  type    = string
  default = "app_vm"
}

variable "app_vm_host_name" {
  type    = string
  default = "app-host"
}

variable "app_vm_platform" {
  type    = string
  default = "standard-v4a"
}


variable "app_vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    app_vm = {
      cores         = 2
      memory        = 4
      core_fraction = 100
    }

  }
}

variable "app_vm_preemptible" {
  type    = bool
  default = true
}

variable "app_vm_nat" {
  type    = bool
  default = true
}


variable "ssh_user_name" {
  type    = string
  default = "test"
}

variable "metadata" {
  type = map(string)
  default = {
    serial-port-enable = 1
  }
}


### cluster vars



variable "cluster_name" {
  type    = string
  default = "project_cluster"
}

variable "cluster_env" {
  type    = string
  default = "PRESTABLE"
}

variable "cluster_version" {
  type    = string
  default = "8.0"
}


variable "cluster_resource_preset" {
  type    = string
  default = "s2.micro"
}

variable "cluster_disk_type" {
  type    = string
  default = "network-ssd"
}

variable "cluster_disk_size" {
  type    = number
  default = 16
}


variable "cluster_zone" {
  type    = string
  default = "ru-central1-a"

}


### db vars

variable "db_name" {
  type    = string
  default = "app_db"
}

variable "db_user" {
  type = string  
}

variable "db_password" {
  type = string  
}

variable "roles" {
  type    = list(string)
  default = ["ALL"]
}

variable "global_permissions" {
  type = list(string)
  default = ["PROCESS"]  
}

variable "authentication_plugin" {
  type = string
  default = "SHA256_PASSWORD"  
}

variable "db_host_name" {
  type = string
  default = "db-host"  
}

### registry vars

