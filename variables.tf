# terraform/variables.tf

variable "org_short" {
  type        = string
  description = "Short organization name"
  default     = "ekgf"
}

variable "project_short" {
  type        = string
  description = "Project id (short code)"
  default     = "dt"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "eu-west-2" # London, make sure that this region is also in the list of availability zones
}

variable "aws_availability_zones" {
  type        = list(string)
  description = "AWS Availability Zones"
  default     = [ "eu-west-2", "us-east-1a", "us-east-1c"]
}

variable "aws_account_id" {
  type        = string
  description = "AWS Account ID, passed in via terraform environment variable TF_VAR_aws_account_id, provided via sops, see keys.json in the root of the repo"
}

variable "aws_access_key_id" {
  type        = string
  description = "AWS Access Key ID, passed in via terraform environment variable TF_VAR_aws_access_key_id, provided via sops, see keys.json in the root of the repo"
  sensitive   = true
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS Secret Access Key, passed in via terraform environment variable TF_VAR_aws_secret_access_key, provided via sops, see keys.json in the root of the repo"
  sensitive   = true
}

variable "environment" {
  type        = string
  description = "Environment (dev / stage / prod)"
}

variable "root_domain_name" {
  type        = string
  description = "Domain name (ie example.com) for the root hosted zone"
  default     = "ekgf.org"
}

variable "main_domain_name" {
  type        = string
  description = "Subdomain (ie 'digital-twin') for which a hosted zone should be delegated"
  default     = "digital-twin"
}

variable "ttl" {
  type        = number
  description = "TTL value for NS DNS records"
  default     = 3600
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default     = {
    "org_short"   = "ekgf",
    "project"     = "dt"
    "environment" = "dev"
  }
}

variable "skip_certificate_validation" {
  type        = bool
  description = "Skip certificate validation"
  default     = false
}
