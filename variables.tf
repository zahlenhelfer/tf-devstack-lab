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

variable "ingress_port" {
  type = map(any)
  default = {
    rule1 = {
      port     = 22,
      protocol = "tcp",
      ethertype = "IPv4",
      remote_prefix= "0.0.0.0/0"
    }
    rule2 = {
      port     = 443,
      protocol = "tcp",
      ethertype = "IPv4",
      remote_prefix= "0.0.0.0/0"
    }
    rule3 = {
      port     = 80,
      protocol = "tcp",
      ethertype = "IPv4",
      remote_prefix= "0.0.0.0/0"
    }
  }
}

variable "egress_port" {
  default = ["22","666","80"] # bei for_reach ein toset() zu nutzen
}