terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.5.1"
    }
  }
}

resource "digitalocean_droplet" "web" {
  image  = data.digitalocean_image.centos_image.image
  name   = var.droplet.name
  region = var.droplet.region
  size   = var.droplet.size
  backups = var.droplet.backups
  ssh_keys = [
    data.digitalocean_ssh_key.droplet_ssh_key.id
  ]

  provisioner "local-exec" {
    command = "bash ./script/prod.sh"
  }
}
