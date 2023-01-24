variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default     = "${ENVIRONMENT_NAME}"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "access_key" {
  description = "AWS Access Key"
  default     = "${AWS_ACCESS_KEY}"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  default     = "${AWS_SECRET_ACCESS_KEY}"
  type        = string
}