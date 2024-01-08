resource "dns_a_record_set" "a_record" {
  count     = length(var.a_records)
  name      = var.a_records[count.index].name
  addresses = var.a_records[count.index].addresses
  zone      = "hashicorp.local."
}

/*resource "dns_ptr_record" "ptr_record" {
  for_each = { for r in var.a_records : r.name => r }

  zone = format("%s.in-addr.arpa.",
                join(".", slice(reverse(split(".", each.value.addresses[0])), 0, 3)))
  name = element(reverse(split(".", each.value.addresses[0])), 0)
  ptr  = format("%s.%s", each.value.name, "hashicorp.local.")
}*/


resource "dns_cname_record" "cname_record" {
  for_each = { for r in var.cname_records : r.name => r }
  name     = each.value.name
  cname    = each.value.cname
  zone     = "hashicorp.local."
}
