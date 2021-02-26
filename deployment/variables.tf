#Access Token get from Digital Ocean Account
variable "do_token" {
  type = string
  default = ""
}
#Private from your machine to have connection with created droplet
variable "pvt_key" {
  type = string
  default = "~/.ssh/id_rsa"
}
#Droplet info
variable "droplet" {
  type = object({
    name = string
    region = string
    size = string
    backups = bool
  })
  default = {
    name = "PHP Droplet"
    region = "sgp1"
    size = "s-2vcpu-2gb"
    backups = false
  }
}

#Define name of ssh key on Digital Ocean account
variable "name_public_key" {
  type = string
  default = "public key for all vps"
}

#Define name of ssh key on Digital Ocean account
variable "image_name" {
  type = string
  default = "centos-7-x64"
}