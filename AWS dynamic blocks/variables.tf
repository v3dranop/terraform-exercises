variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [80, 22, 443]
}