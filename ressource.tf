
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