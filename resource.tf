resource "aws_vpc"  "environment-resource-expample"{
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = { Name:"aws_terraform"}
}
resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-resource-expample.cidr_block, 3, 1 )}"
  vpc_id = "${aws_vpc.environment-resource-expample.id}"
  availability_zone = "us-west-1c"

  tags = {Name:"private_subnet"}
}

resource "aws_subnet" "public_subnet" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-resource-expample.cidr_block,2 ,2 )}"
  vpc_id = "${aws_vpc.environment-resource-expample.id}"
  availability_zone = "us-west-1a"

  tags = {Name:"public_subnet"}
}

resource "aws_security_group" "my_network_security" {
  vpc_id = "${aws_vpc.environment-resource-expample.id}"
  ingress {
    cidr_blocks = [
      "${aws_vpc.environment-resource-expample.cidr_block}"
      ]
    from_port = 80
    protocol = "tcp"
    to_port = 80
  }
  ingress {
    cidr_blocks = [
      "${aws_vpc.environment-resource-expample.cidr_block}"
    ]
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
  }
  ingress {
    cidr_blocks = [
      "${aws_vpc.environment-resource-expample.cidr_block}"
    ]
    from_port = 22
    protocol = "tcp"
    to_port = 22
  }
}