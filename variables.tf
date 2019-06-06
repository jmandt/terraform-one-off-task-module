variable "environment" {
  description = "Environment in which the resource will be running (dev, prod, stg, other)"
}

variable "project" {
  description = "General name of the project where these resources will be instantiated"
}

variable "team" {
  description = "Team responsible for managing these resources"
}

variable "account_id" {
  description = "AWS account ID where resources will be deployed"
}

variable "application_name" {
  description = "Desired ECS Cluster name used with environment"
}

variable "task_subnet_ids" {
  description = "Single string with all the subnets separated by commas"
  type        = "string"
}

variable "vpc_id" {
  description = "Base VPC where the resources in this modules should be launched"
}

variable "ecs_cluster_id" {
  description = "ID of ECS Fargate type Cluster to deploy the service and task"
}

variable "ecs_cluster_name" {
  description = "Name of ECS Fargate type Cluster to deploy the service and task"
}

variable "task_revision" {
  description = "Number of the  Task revision the ECS service should aim to launch"
}

variable "rendered_fargate_container_def" {
  description = "A tf data template file rendered with the container definition. example: data.template_file.test_fargate_tls_task_def.rendered"
}

variable "task_cpu" {
  description = "How much CPU to allocate to the  FARGATE tasks"
}

variable "task_memory" {
  description = "How much Memory to allocate to the  FARGATE tasks"
}

variable "log_retention_period" {
  description = "How many days to retain  service logs in CloudWatch"
}
