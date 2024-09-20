module "openstack_security_group" {
  source = "./modules/os_sec_group"

  security_group_name = "Mein ModulTest für SecGroups"
  security_group_description = "Toll wenn das funktioniert"
  security_group_rules = var.security_group_rules

}