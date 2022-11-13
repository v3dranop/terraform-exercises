variable "team" {
  type = map(string)

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd     = "t2.nano"
  }
}
variable "vpc_cidr" {}
variable "public_subnet_cidr" {}