variable "aws_owner_id" {
  description = "owner of ami"
}

variable "ami_name" {
  description = "ami name"
}

variable "instance_type" {
  description = "The instance type for our ASG"
}

variable "keypair" {
  description = "the name of the keypair to connect to our EC2 instance"
}

variable "aws_region" {
  description = "the region of AZ"
}

variable "private_subnet_a" {
  description = "name of the private subnet we need for the asg AZ-a"
}

variable "private_subnet_b" {
  description = "name of the private subnet we need for the asg AZ-b"
}

variable "public_subnet_a" {
  description = "name of the public subnet we need for the asg AZ-a"
}

variable "public_subnet_b" {
  description = "name of the public subnet we need for the asg AZ-b"
}

variable "vpc_name" {
  description = "name of the vpc"
}