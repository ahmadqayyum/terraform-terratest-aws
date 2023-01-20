
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${var.env_prefix_name}-ec2-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}


resource "local_file" "ec2key" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "${var.USER_DATA_DIR}/${aws_key_pair.generated_key.key_name}"
}