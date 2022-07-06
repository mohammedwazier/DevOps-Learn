module "yaml" {
    source  = "0x022b/yaml-variables/tfe"
    version = "~> 1.0"

    organization = "masihkasar-cloudflare-credentials"
    workspace    = "credentials"
}

terraform {
    required_providers {
        cloudflare = {
            source = "cloudflare/cloudflare"
            version = "~> 3.0"
        }
    }
}

provider "cloudflare" {
    email = module.yaml.variables.email_id
    api_token = module.yaml.variables.api_token
}

resource "cloudflare_record" "www" {
    zone_id = module.yaml.variables.zone_id
    name = "www"
    value = module.yaml.variables.ip_public
    type = "A"
    proxied = true
}