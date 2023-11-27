variable "dns_username" {
  type = string
}

variable "dns_password" {
  type = string
}

variable "dns_realm" {
  type = string
}

variable "dns_server" {
  type = string
}

variable "dns_records" {
  description = "A list of DNS records to create."
  type = list(object({
    record_type = string
    zone        = string
    name        = string
    addresses   = list(string) // For A and PTR records
    cname       = string       // For CNAME records
    ttl         = number
  }))
}
