resource "aws_eip" "ip" {
  vpc = true
  tags = {
    Name = "test1"
  }
}

resource "aws_eip" "ip2" {
  vpc      = true
  provider = aws.east2
  tags = {
    Name = "test2"
  }
}
