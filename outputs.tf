output "server_public_ip" {
  value = openstack_compute_instance_v2.webServer[*].access_ip_v4
}

output "database_public_ip" {
  value = openstack_compute_instance_v2.database[*].access_ip_v4
}