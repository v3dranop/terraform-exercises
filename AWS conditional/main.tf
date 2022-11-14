resource "aws_instance" "Red_hat_HA" {
  ami           = var.RH == "yes" ? var.HA : var.no_HA
  instance_type = "t2.micro"
}
