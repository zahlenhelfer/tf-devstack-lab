data "openstack_images_image_v2" "cirros" {
  name        = "CirrOS"
  most_recent = true
}

data "openstack_images_image_v2" "debian" {
  name        = "Debian"
  most_recent = true
}