variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default     = "allamerica-challenge"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "access_key" {
  description = "AWS Access Key"
  default     = "your aws private key"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  default     = "your aws secret key"
  type        = string
}