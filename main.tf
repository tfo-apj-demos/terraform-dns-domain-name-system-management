variable "dns_server" {
  description = "dns server fqdn"
}

resource "dns_a_record_set" "a_record" {
  for_each  = { for r in var.a_records : r.name => r }
  name      = each.value.name
  addresses = each.value.addresses
  zone      = "hashicorp.local."
  ttl       = 604800
}

/*resource "dns_ptr_record" "ptr_record" {
  for_each = { for r in var.a_records : r.name => r }

  zone = format("%s.%s.%s.in-addr.arpa.",
    element(reverse(split(".", each.value.addresses[0])), 0),
    element(reverse(split(".", each.value.addresses[0])), 1),
  element(reverse(split(".", each.value.addresses[0])), 2))
  name = element(reverse(split(".", each.value.addresses[0])), 0)
  ptr  = format("%s.%s", each.value.name, "hashicorp.local.")
  ttl  = 604800
}*/

resource "dns_cname_record" "cname_record" {
  for_each = { for r in var.cname_records : r.name => r }
  name     = each.value.name
  cname    = each.value.cname
  zone     = "hashicorp.local."
  ttl      = 604800
}
