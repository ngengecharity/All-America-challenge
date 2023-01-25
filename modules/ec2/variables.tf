variable "namespace" {
  type = string
}

variable "vpc" {
  type = any
}

variable key_name {
  type = string
}

variable "sg_pub_id" {
  type = any
}

variable "sg_priv_id" {
  type = any
}

variable "sg_db_access_id" {
  type = any
}

variable "web_sg_id" {
  type = any
}

variable "web2_sg_id" {
  type = any
}

variable "instance_type" {
  description = "AWS Instance Types"
  default     = "t2.micro"
  type        = string
}