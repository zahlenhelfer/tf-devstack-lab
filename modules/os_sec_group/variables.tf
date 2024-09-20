variable "security_group_name" {
  type = string
}

variable "security_group_description" {
  type = string
}

variable "security_group_rules" {
  description = "The security group rules for the web servers."
  type = object({
    ingress_rules = optional(map(object({
      cidr_ipv4   = string
      from_port   = number
      ip_protocol = string
      to_port     = number
      description = string
      ethertype=string
    })))
    egress_rules = optional(map(object({
      cidr_ipv4   = string
      from_port   = number
      ip_protocol = string
      to_port     = number
      description = string
      ethertype=string
    })))
  })
}