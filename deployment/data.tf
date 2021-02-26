#Get ssh key from user account
data "digitalocean_ssh_key" "droplet_ssh_key" {
  name = var.name_public_key
}

# User filter to get exact image
data "digitalocean_images" "centos_image" {
  filter {
    key    = "distribution"
    values = ["Centos"]
  }
}
