terraform {
    required_providers {
        cloudflare = {
            source = "cloudflare/cloudflare"
            version = "~> 3.0"
        }
    }
}

provider "cloudflare" {
    email = var.email_id
    api_token = var.api_token
}

resource "cloudflare_record" "www" {
    zone_id = var.zone_id
    name = "www"
    value = var.ip_public
    type = "A"
    proxied = true
}