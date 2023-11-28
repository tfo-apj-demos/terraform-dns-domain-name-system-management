terraform {
  required_providers {
    dns = {
      source  = "hashicorp/dns"
      version = "~> 3.3"
    }
  }
}
provider "dns" {
  update {
    server = var.dns_server # Using the hostname is important in order for an SPN to match
  }
}

variable "dns_server" {
  description = "DNS Server FQDN"
  type        = string
}

resource "dns_a_record_set" "this" {
  name = "test"
  addresses = [
    "172.21.15.160"
  ]
  zone = "hashicorp.local."
}


/*module "domain-name-system-management" {
  #source  = "app.terraform.io/tfo-apj-demos/domain-name-system-management/dns"
  source = "../../terraform-dns-management"
  #version = "1.0.4"
  
  dns_server = "dc-0.hashicorp.local"
  a_records = [
    {
      name      = "test"
      addresses = [ "172.21.15.160" ]
    }
  ]
}*/