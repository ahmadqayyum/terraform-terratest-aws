####################################################
# Target Group Creation
####################################################

resource "aws_lb_target_group" "tg" {
  name        = "${var.env_prefix_name}-tg"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = "${var.vpc_id}"
}

####################################################
# Target Group Attachment with Instance
####################################################

resource "aws_alb_target_group_attachment" "tgattachment" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.ec2_instance.id
}

####################################################
# Application Load balancer
####################################################

resource "aws_lb" "lb" {
  name               = "${var.env_prefix_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = "${var.public_subnet_id}"
}

####################################################
# Listener
####################################################

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
