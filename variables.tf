variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "db_name" {
  description = "Enter your dbname"
  type        = string
}

variable "db_password" {
  description = "Enter your dbpassword"
  type        = string
}

variable "db_username" {
  description = "database username"
  type        = string
}