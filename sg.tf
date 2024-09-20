
resource "openstack_networking_secgroup_v2" "secgroup_1" {
  name                 = "SG-Webserver"
  description          = "My neutron security group via Terraform"
  delete_default_rules = true
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_1" {
  for_each          = var.ingress_port
  direction         = "ingress"
  description       = each.key
  ethertype         = each.value.ethertype
  protocol          = each.value.protocol
  port_range_min    = each.value.port
  port_range_max    = each.value.port
  remote_ip_prefix  = each.value.remote_prefix
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_2" {
  for_each = toset(var.egress_port)
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = each.value
  port_range_max    = each.value
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}