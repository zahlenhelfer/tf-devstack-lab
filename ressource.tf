resource "openstack_compute_instance_v2" "webServer" {
  count           = length(var.serverName) #var.anzahlDerServer
  name            = var.serverName[count.index]
  image_id        = data.openstack_images_image_v2.debian.id
  flavor_id       = "2"
  security_groups = [openstack_networking_secgroup_v2.secgroup_1.name]
  metadata        = var.metadata
  user_data       = file("./installWebserver.sh")
  key_pair        = "my_key"

  network {
    name = "private"
  }

  depends_on = [
    openstack_networking_secgroup_v2.secgroup_1
  ]

  lifecycle {
    create_before_destroy = true
  }

}

# resource "openstack_networking_floatingip_v2" "fip1" {
#   pool = "public"
#   port_id = 
# }

# resource "openstack_networking_floatingip_associate_v2" "fip1_assc" {
#   floating_ip = openstack_networking_floatingip_v2.fip1.address
#   instance_id = openstack_compute_instance_v2.webServer[0].id
# }