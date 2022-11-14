variable "RH" {
  description = "Do you need Red Hat Enterprise Linux 9 with High Availability?(yes/no)"
}

variable "HA" {
  default = "ami-0d37ecbd75ec5a8c0"
}

variable "no_HA" {
  default = "ami-05723c3b9cf4bf4ff"
}
