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
  default     = "enter your access key here"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  default     = "enter your secret access key here"
  type        = string
}