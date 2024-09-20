resource "openstack_compute_instance_v2" "database" {
  count           = (var.buildDatabaseAsVM) ? 1 : 0
  name            = "Datenbank"
  image_id        = data.openstack_images_image_v2.cirros.id
  flavor_id       = "1"
  security_groups = var.security_groups
  metadata        = var.metadata

  network {
    name = "shared"
  }
}