provider "openstack" {
  # Configuration options
  user_name   = "demo"
  password    = "geheim"
  tenant_name = "demo"
  auth_url    = "http://10.0.0.101/identity"
  region      = "RegionOne"
}