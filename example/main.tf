variable "dns_server" {
  description = "DNS Server FQDN"
  type = string
}

module "domain-name-system-management" {
  source  = "app.terraform.io/tfo-apj-demos/domain-name-system-management/dns"
  version = "1.0.4"
  
  a_records = [
    {
      name      = "test"
      addresses = [ "172.21.15.160" ]
    }
  ]
}