output "a_record_ids" {
  value = { for k, v in dns_a_record_set.a_record : k => v.id }
}

/*output "ptr_record_ids" {
  value = { for k, v in dns_ptr_record.ptr_record : k => v.id }
}*/

output "cname_record_ids" {
  value = { for k, v in dns_cname_record.cname_record : k => v.id }
}