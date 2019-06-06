locals {
  service_name = "${var.environment}-${var.application_name}-ecs-service"
}

###############################################################
#                 ECS  Service & Task
###############################################################

resource "aws_ecs_service" "service_without_lb" {

  name            = "${local.service_name}"
  cluster         = "${var.ecs_cluster_id}"
  task_definition = "${var.application_name}:${var.task_revision}"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = ["${aws_security_group.ecs_service_task_sg.id}"]
    subnets         = ["${split(",", var.task_subnet_ids)}"]
    assign_public_ip = true
  }

  lifecycle {
    ignore_changes = ["desired_count"]
  }
}


resource "aws_ecs_task_definition" "fargate" {
  family                   = "${var.application_name}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = "${aws_iam_role.this.arn}"
  execution_role_arn       = "${aws_iam_role.this.arn}"
  cpu                      = "${var.task_cpu}"
  memory                   = "${var.task_memory}"
  container_definitions    = "${var.rendered_fargate_container_def}"
}

#
# CloudWatch
#

resource "aws_cloudwatch_log_group" "container_logs" {
  name              = "/ecs/fargate/${var.environment}/${var.application_name}"
  retention_in_days = "${var.log_retention_period}"
}