
resource "openstack_networking_secgroup_v2" "secgroup_1" {
  name                 = "SG-Webserver"
  description          = "My neutron security group via Terraform"
  delete_default_rules = true
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_1" {
  for_each          = var.web_security_group_rules.ingress_rules
  direction         = "ingress"
  description       = each.value.description
  ethertype         = each.value.ethertype
  protocol          = each.value.ip_protocol
  port_range_min    = each.value.from_port
  port_range_max    = each.value.to_port
  remote_ip_prefix  = each.value.cidr_ipv4
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_2" {
  for_each          = var.web_security_group_rules.egress_rules
  direction         = "egress"
  description       = each.value.description
  ethertype         = each.value.ethertype
  protocol          = each.value.ip_protocol
  port_range_min    = each.value.from_port
  port_range_max    = each.value.to_port
  remote_ip_prefix  = each.value.cidr_ipv4
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}