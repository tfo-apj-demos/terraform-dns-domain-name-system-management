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

module "domain-name-system-management" {
  source  = "app.terraform.io/tfo-apj-demos/domain-name-system-management/dns"
  #source = "../../terraform-dns-management"
  version = "1.0.4"

  dns_server   = var.dns_server
  dns_realm    = var.dns_realm
  dns_password = var.dns_password
  dns_username = var.dns_username
  a_records = [
    {
      name      = "test"
      addresses = [ "172.21.15.160" ]
    }
  ]
}