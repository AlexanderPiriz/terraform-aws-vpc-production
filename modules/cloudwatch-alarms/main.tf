resource "aws_cloudwatch_metric_alarm" "cpu_high" {
    alarm_name          = "${var.name_prefix}-cpu-high"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = "2"
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = "300"
    statistic           = "Average"
    threshold           = var.cpu_threshold
    alarm_description   = "EC2 CPU is above ${var.cpu_threshold}%"
    dimensions = {
        InstanceId = var.instance_id            
    }
    alarm_actions = var.alarm_actions
}

resource "aws_cloudwatch_metric_alarm" "status_check_failed" {
    alarm_name          = "${var.name_prefix}-status-check-failed"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    metric_name         = "StatusCheckFailed"
    namespace           = "AWS/EC2"
    period              = 60
    statistic           = "Maximum"
    threshold           = 1
    alarm_description   = "EC2 instance status check has failed"
    dimensions = {
        InstanceId = var.instance_id            
    }
    alarm_actions = var.alarm_actions   
}