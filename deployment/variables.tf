#Access Token get from Digital Ocean Account
variable "do_token" {
  type = string
  default = "9dae390da02de07df5eb5753fbc83a3f4650021318f6035a00080a84fe306042"
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
    name = "Testing"
    region = "sgp1"
    size = "s-1vcpu-1gb"
    backups = false
  }
}
