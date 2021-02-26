#Get ssh key from user account
data "digitalocean_ssh_key" "droplet_ssh_key" {
  name = var.name_public_key
}

# User filter to get Centos 7.6 image
data "digitalocean_image" "centos_image" {
  slug = var.image_name
}
