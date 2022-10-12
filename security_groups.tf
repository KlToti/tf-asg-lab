#create a new security group
resource "aws_security_group" "app_server" {
  name        = "asg-app-sg"
  description = "allow connection only from loadbalencer as shown in the diagram"
  vpc_id      = data.aws_vpc.talent_academy.id

  # INBOUND CONNECTIONS
  ingress {
    description = "Access to port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.blue_green_lb.id]
  }

  # OUTBOUT CONNECTIONS‚
  egress {
    description = "Allow access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "asg-app-sg"
  }
}


resource "aws_security_group" "blue_green_lb" {
  name        = "blue-green-lb-sg"
  description = "allow connection lb"
  vpc_id      = data.aws_vpc.talent_academy.id

  # INBOUND CONNECTIONS
  ingress {
    description = "Access to port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # OUTBOUT CONNECTIONS‚
  egress {
    description = "Allow access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "blue-green-lb-sg"
  }
}
