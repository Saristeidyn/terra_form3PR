variable "digitalocean_token" {
  type = string
  description = "DigitalOcean API Token" ## ok so this is what make the varable for the token in terraform.tfvar
}


terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"  # DigitalOcean provider source
      version = "~> 2.0"                   
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_token             # And this uses the tocken
}

# Droplet Resource Definition
resource "digitalocean_droplet" "example_droplet" {
  name   = "example-droplet"                 # Sets the droplet name
  region = "sfo3"                            # Defines the region for the droplet
  size   = "s-1vcpu-1gb"                     # Sets the droplet size for cost optimization
  image  = "ubuntu-20-04-x64"                # Specifies Ubuntu 20.04 as the operating system
}