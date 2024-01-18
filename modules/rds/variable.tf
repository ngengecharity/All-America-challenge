variable "allocated_storage" {
  description = "The amount of allocated storage in gigabytes"
  type        = number
}

variable "instance_type" {
  description = "The RDS instance type"
  type        = string
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
}

variable "namespace" {
  description = "environment name"
  type        = string
}

variable "sg_db_access_id" {
  type = any
}

variable "vpc" {
  type = any
}

# Define other variables as needed