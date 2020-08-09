variable "env" {
  type    = string
  default = "staging"
}

variable "service" {
  type    = string
  default = "es_project"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
  type    = string
  default = "10.0.0.0/24"
}

variable "public_subnet_c_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet_d_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_subnet_a_cidr" {
  type    = string
  default = "10.0.10.0/24"
}

variable "private_subnet_c_cidr" {
  type    = string
  default = "10.0.11.0/24"
}

variable "private_subnet_d_cidr" {
  type    = string
  default = "10.0.12.0/24"
}

variable "route_table_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
