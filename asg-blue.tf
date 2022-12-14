resource "aws_launch_template" "blue-template" {
  name = "blue-template"

  image_id      = data.aws_ami.ubuntu_image.id
  instance_type = var.instance_type

  #identifies the connection to ec2
  key_name               = var.keypair
  vpc_security_group_ids = [aws_security_group.app_server.id]

  #argument version and color will be used at user-data.sh.tpl file for the web site
  user_data = base64encode(templatefile("${path.module}/user-data.sh.tpl", {
    version = "Blue Website",
    color   = "blue"
  }))


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "blue-server"
    }
  }
}

resource "aws_autoscaling_group" "blue_asg" {
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  #specify where to deploy the asg
  vpc_zone_identifier = [data.aws_subnet.private_a.id]

  launch_template {
    id      = aws_launch_template.blue-template.id
    version = "$Latest"
  }
}