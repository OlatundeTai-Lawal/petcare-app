terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}
# b. for your Main.tf, use below Code Snippet
resource "digitalocean_kubernetes_cluster" "doks" {
  name   = "ficky-cluster"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.27.4-do.0"
  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}
# c. for your variables.tf, use below code snippet

variable "do_token" {
  type        = string
  description = "Your Digital Ocean Api Token "
}

