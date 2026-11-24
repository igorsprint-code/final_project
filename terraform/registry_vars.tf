variable "role" {
    type = string
    default = "container-registry.images.puller"  
}


variable "members" {
  type = list(string)
  default = ["system:allUsers"]  
}

variable "registry_name" {
  type    = string
  default = "project-registry"
}