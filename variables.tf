variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default     = "charity-terraform-project"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "access_key" {
  description = "AWS Access Key"
  default     = "AKIAUZWAAB46HC74EVO5"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  default     = "I08Vpt51Dbg6cnVVS6d7KOSLyWWUTiSSJJY7LWEQ"
  type        = string
}