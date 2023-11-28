variable "dns_server" {
  type    = string
}

variable "a_records" {
  description = "List of A records"
  type = list(object({
    name      = string
    addresses = list(string)
  }))
  default = []
}

variable "cname_records" {
  description = "List of CNAME records"
  type = list(object({
    name  = string
    cname = string
  }))
  default = []
}

