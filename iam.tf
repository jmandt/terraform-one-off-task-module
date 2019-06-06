#
# IAM Role for the Task to Assume. Exported in order for further mod
#

resource "aws_iam_role" "this" {
  name               = "${var.environment}-${var.application_name}-iam-role"
  assume_role_policy = "${data.aws_iam_policy_document.ecs_task_assume_role.json}"
}

resource "aws_iam_role_policy" "ecs_service_cloudwatch_policy" {
  name   = "${var.environment}-${var.application_name}-cloudwatch-policy"
  role   = "${aws_iam_role.this.name}"
  policy = "${data.aws_iam_policy_document.base_ecs_task_permissions.json}"
}

data "aws_iam_policy_document" "ecs_task_assume_role" {

  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = [
        "ecs-tasks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "base_ecs_task_permissions" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
    ]

    resources = [
      "${aws_cloudwatch_log_group.container_logs.arn}",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "*",
    ]

    resources = [
      "*",
    ]
  }
}
