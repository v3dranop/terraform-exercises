module "sgmodule" {
  source = "../../modules/sg"
}

resource "aws_instance" "web" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t3.micro"
  vpc_security_group_ids = [module.sgmodule.sg_id]
  tags = {
    Name = "local module test instance"
  }
}

output "sg_id_output" {
  value = module.sgmodule.sg_id
}
