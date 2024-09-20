variable "imageId" {
  type    = string
  default = "ba8ff7bb-ca02-4c0c-b4d6-21cff968a7bf"
  
  validation {
    condition     = length(var.imageId) == 36
    error_message = "Image-id length must be 36"
  }
}

variable "anzahlDerServer" {
  type        = number
  description = "Bitte die Anzahl der Webserver eingeben"
  default     = 2
}

variable "serverName" {
  type    = list(string)
  default = ["Webserver 1", "ReverseProxy"]
}

variable "metadata" {
  type = map(string)
  default = {
    Kostenstelle = "4711"
    Owner        = "Infrastruktur"
    KRITIS       = "false"
  }
}

variable "security_groups" {
  type    = list(string)
  default = ["default", "SSH"]
}

variable "buildDatabaseAsVM" {
  type    = bool
  default = false
}

variable "web_security_group_rules" {
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