output "a_record_ids" {
  value = [for record in dns_a_record_set.a_record : record.id]
}

output "ptr_record_ids" {
  value = [for record in dns_ptr_record.ptr_record : record.id]
}

output "cname_record_ids" {
  value = [for record in dns_cname_record.cname_record : record.id]
}