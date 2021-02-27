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

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.private_key)
    timeout = "1m"
  }

  provisioner "file" {
    source      = "./script/prod.sh"
    destination = "/home/prod.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/prod.sh",
      "bash /home/prod.sh",
      "rm -f /home/prod.sh /home/Makefile /home/README.md && rm -rf /home/tinny-docker/config && rm -rf /home/tinny-docker/deployment"
    ]
  }
}
