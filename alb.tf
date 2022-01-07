resource "aws_lb" "sample" {
  name               = "sample-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = ["subnet-000619559d9f1f935", "subnet-04db76bbd77f5e23d"]
  # enable_deletion_protection = true


  tags = {
    Environment = "sample"
  }
}

# listner
resource "aws_lb_listener" "L1" {
  load_balancer_arn = aws_lb.sample.arn
  port              = "80"
  protocol          = "HTTP"



  default_action {
    type             = "forward"
    target_group_arn =  aws_lb_target_group.tg-1.arn
  }
}





resource "aws_lb_listener_rule" "Lisener-1" {
  listener_arn = aws_lb_listener.L1.arn
  # priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-1.arn
  }

  condition {
    path_pattern {
      values = ["/anji/*"]
    }
  }

  # condition {
#     host_header {
#       values = ["example.com"]
#     }
#   }
 }



resource "aws_lb_listener_rule" "Lisener-2" {
  listener_arn = aws_lb_listener.L1.arn
  # priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-2.arn
  }

  condition {
    path_pattern {
      values = ["/sai/*"]
    }
  }

#   condition {
#     host_header {
#       values = ["example.com"]
#     }
#   }
 }















