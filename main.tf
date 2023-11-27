resource "dns_a_record_set" "a_record" {
  count     = length([for record in var.dns_records : record if record.record_type == "A"])
  zone      = var.dns_records[count.index].zone
  name      = var.dns_records[count.index].name
  addresses = var.dns_records[count.index].addresses
  ttl       = var.dns_records[count.index].ttl
}

resource "dns_ptr_record" "ptr_record" {
  count = length([for record in var.dns_records : record if record.record_type == "PTR"])
  zone  = var.dns_records[count.index].zone
  name  = var.dns_records[count.index].name
  ptr   = var.dns_records[count.index].addresses[0] // Assuming single address for PTR
  ttl   = var.dns_records[count.index].ttl
}

resource "dns_cname_record" "cname_record" {
  count = length([for record in var.dns_records : record if record.record_type == "CNAME"])
  zone  = var.dns_records[count.index].zone
  name  = var.dns_records[count.index].name
  cname = var.dns_records[count.index].cname
  ttl   = var.dns_records[count.index].ttl
}