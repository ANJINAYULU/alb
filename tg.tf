# resource "aws_lb" "sample" {
#   name               = "sample-lb-tf"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = ["aws_security_group.alb-sg.id"]
#   # subnets            = ["subnet-000619559d9f1f935".id}", "${"subnet-04db76bbd77f5e23d".id}"]
#   subnets                    = ["subnet-000619559d9f1f935", "subnet-04db76bbd77f5e23d"]
#   # enable_deletion_protection = true


#   tags = {
#     Environment = "sample"
#   }
# }

# instance target group

resource "aws_lb_target_group" "tg-1" {
  name     = "tg-1-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-01968d6f75658664f"
}
resource "aws_lb_target_group" "tg-2" {
  name     = "tg-2-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-01968d6f75658664f"
}
# resource "aws_vpc" "main" {
#   cidr_block = "172.31.0.0/16"
# }


resource "aws_lb_target_group_attachment" "attach-1" {
  target_group_arn = aws_lb_target_group.tg-1.arn
  target_id        = aws_instance.FOOTBALL.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "attach-2" {
  target_group_arn = aws_lb_target_group.tg-2.arn
  target_id        = aws_instance.CRICKET.id
  port             = 80
}

# # listner
# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = "aws_lb.front_end.arn"
#   port              = "80"
#   protocol          = "HTTP"



#   default_action {
#     type             = "forward"
#     target_group_arn =" aws_lb_target_group.front_end.arn"
#   }
# }



