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
  default     = "AKIAQ4MYQM5VYEUQRVNB"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  default     = "LvmggxoBOZpl5iMn4sI5xR5qWnZ1ar7vb2v73eaT"
  type        = string
}