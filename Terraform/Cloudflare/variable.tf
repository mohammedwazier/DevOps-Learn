variable "email_id" {
    description = "Email ID Cloudflare Account"
    type = string
}

variable "api_token" {
    description = "API Token from cloudflare Generate Token"
    type = string
}

variable "zone_id" {
    description = "Zone ID in Cloudflare Account"
    type = string
}

variable "ip_public" {
    description = "Public IP"
    type = string
}

variable "domain" {
    description = "Default Domain"
    type = string
}