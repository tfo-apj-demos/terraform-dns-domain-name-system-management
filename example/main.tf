module "domain-name-system-management" {
  source  = "app.terraform.io/tfo-apj-demos/domain-name-system-management/dns"
  version = "1.0.4"

  dns_server = "dc-0.hashicorp.local"
  
  a_records = [
    {
      name      = "test"
      addresses = ["172.21.15.160"]
    }
  ]
}