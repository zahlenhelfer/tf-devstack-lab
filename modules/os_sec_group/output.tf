output "security_group_name" {
  value= openstack_networking_secgroup_v2.secgroup_1.name
}

output "security_group_id" {
  value = openstack_networking_secgroup_v2.secgroup_1.id
}