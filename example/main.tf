
module "dns_records" {
  source = "../../terraform-dns-management"

  a_records = [
    {
      name      = "test"
      addresses = ["172.21.15.160"]
    }
  ]
}