terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.5.1"
    }
  }
}

resource "digitalocean_droplet" "web" {
  image  = data.digitalocean_images.centos_image
  name   = var.droplet.name
  region = var.droplet.region
  size   = var.droplet.size
  backups = var.droplet.backups

  provisioner "local-exec" {
    command = "bash ./script/prod.sh"
  }
}
