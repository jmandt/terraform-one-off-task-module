output "aws_cloudwatch_log_group_container_log_id" {
  value = "${aws_cloudwatch_log_group.container_logs.id}"
}

output "aws_cloudwatch_log_group_container_log_arn" {
  value = "${aws_cloudwatch_log_group.container_logs.arn}"
}

output "aws_cloudwatch_log_group_container_log_name" {
  value = "${aws_cloudwatch_log_group.container_logs.name}"
}

output "aws_security_group_task_sg_id" {
  value = "${aws_security_group.ecs_service_task_sg.id}"
}

output "aws_security_group_task_sg_arn" {
  value = "${aws_security_group.ecs_service_task_sg.arn}"
}

output "aws_security_group_task_sg_name" {
  value = "${aws_security_group.ecs_service_task_sg.name}"
}

output "aws_ecs_fargate_task_arn"{
  value = "${aws_ecs_task_definition.fargate.arn}"
}

output "aws_ecs_fargate_task_revision"{
  value = "${aws_ecs_task_definition.fargate.revision}"
}


