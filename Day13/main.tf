variable "aws_vpc" {
  
}

data "aws_vpc" "vpc-name" {
    filter {
      name = "tag:name"
      values = ["default"]
    
    }
}

data "aws_subnet" "shared" {
  filter {
    name = "tag:Name"
    values = ["subneta"]
  }
  vpc_id = data.aws_vpc.vpc-name.id
}

data "aws_ami" "linux2" {
    owners = ["amazon"]
    most_recent = true

    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gcp2"]
    }
  
  filter {
    name = "virtualization-type"
    values = ["hvm"]

  }
}

resource "aws_instance" "example" {
  ami = data.aws_ami.linux2
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.shared.id
}