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
    image = string
    name = string
    region = string
    size = string
    backups = bool
  })
  default = {
    image = "ubuntu-18-04-x64"
    name = "your droplet name"
    region = "sgp1"
    size = "s-1vcpu-1gb"
    backups = false
  }
}

variable "name_public_key" {
  type = string
  default = "public key for all vps"
}
