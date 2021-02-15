terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
}

data "digitalocean_ssh_key" "terraform" {
  name = var.name_public_key
}

resource "digitalocean_droplet" "web" {
  image  = var.droplet.image
  name   = var.droplet.name
  region = var.droplet.region
  size   = var.droplet.size
  backups = var.droplet.backups

  provisioner "local-exec" {
    command = "bash ./script/prod.sh"
  }
}
