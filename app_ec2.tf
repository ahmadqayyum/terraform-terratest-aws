resource "aws_instance" "ec2_instance" {

    ami = "${var.app_ami_id}"
    subnet_id = "${var.private_subnet_id}"
    instance_type = "${var.app_instance_type}"
    key_name = aws_key_pair.generated_key.key_name
    security_groups = [aws_security_group.app_sg.id]

    tags = {
      Name = "${var.env_prefix_name}-app-ec2"
  }

  lifecycle {
    ignore_changes = [
      disable_api_termination,ebs_optimized,hibernation,security_groups,
      credit_specification,network_interface,ephemeral_block_device]
  }
} 

