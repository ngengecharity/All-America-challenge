variable "namespace" {
  type = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "create_vpc" {
  description = "Condition to create VPC"
  default     = "true"
  type        = bool
}