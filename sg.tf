#
# ECS Service Task Security Group
#

resource "aws_security_group" "ecs_service_task_sg" {
  name        = "${var.environment}-${var.application_name}-task-sg"
  description = "manage access to the tasks running the ${var.application_name}"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}-${var.application_name}-tasks-sg"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Team        = "${var.team}"
  }
}

resource "aws_security_group_rule" "task_egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.ecs_service_task_sg.id}"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}
