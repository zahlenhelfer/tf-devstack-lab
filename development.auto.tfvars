anzahlDerServer   = 1
buildDatabaseAsVM = true
security_group_rules = {
  ingress_rules = {
    "http-public-subnet" = {
      cidr_ipv4   = "10.0.0.0/24"
      from_port   = 80
      ip_protocol = "tcp"
      to_port     = 80
      description = "HTTP-Access from Internal-Net"
      ethertype = "IPv4"
    }
    "https-public-subnet" = {
      cidr_ipv4   = "10.0.0.0/24"
      from_port   = 443
      ip_protocol = "tcp"
      to_port     = 443
      description = "HTTPS Access"
      ethertype = "IPv4"
    }
    "ssh-public-subnet" = {
      cidr_ipv4   = "10.0.0.0/24"
      from_port   = 22
      ip_protocol = "tcp"
      to_port     = 22
      description = "SSH Access"
      ethertype = "IPv4"
    }
  }
  egress_rules = {
    "all" = {
      cidr_ipv4 = "0.0.0.0/0"
      from_port = 0
      ip_protocol = "tcp"
      to_port   = 0
      ethertype = "IPv4"
      description = "Allow all traffic to exit the net"
    }
  }
}
