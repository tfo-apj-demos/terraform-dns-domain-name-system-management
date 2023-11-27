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
    server = var.dns_server
    gssapi {
      realm    = var.dns_realm
      username = var.dns_username
      password = var.dns_password
    }
  }
}