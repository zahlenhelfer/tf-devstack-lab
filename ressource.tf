
resource "openstack_compute_instance_v2" "webServer" {
  count           = var.anzahlDerServer
  name            = "${var.serverName} - ${count.index+1}"
  image_id        = var.imageId
  flavor_id       = "1"
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = "shared"
  }
}
