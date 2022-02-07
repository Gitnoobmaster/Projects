provider "aws" {
    region = "eu-west-3"
}
variable "cidr_block" {
  type = list(object({
      cidr_block = string
      name = string
      }))
  description = "cidr_block for vpc and subnet"
}

resource "aws_vpc" "dev-vpc" {
    cidr_block = var.cidr_block[0].cidr_block
    tags = {
        Name = var.cidr_block[0].name
    }
} 

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.dev-vpc.id
    cidr_block = var.cidr_block[1].cidr_block
    availability_zone = "eu-west-3a"
    tags = {
        Name: var.cidr_block[1].name
    }
}
