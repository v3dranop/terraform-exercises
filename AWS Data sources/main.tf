resource "aws_instance" "data_ami_test"{
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
   count = 3

   tags = {
     Name = "DS_test.${count.index}"
   }

}