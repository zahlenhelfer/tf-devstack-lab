terraform {
  required_version = ">=1.4.0"
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "2.1.0"
    }
  }
}

provider "openstack" {
  # Configuration options
  user_name   = "demo"
  password    = "geheim"
  tenant_name = "demo"
  auth_url    = "http://10.0.0.101/identity"
  region      = "RegionOne"
}

resource "openstack_compute_instance_v2" "meinErsterServer" {
  name            = "erster Server"
  image_id        = "ba8ff7bb-ca02-4c0c-b4d6-21cff968a7bf"
  flavor_id       = "1"
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = "shared"
  }
}