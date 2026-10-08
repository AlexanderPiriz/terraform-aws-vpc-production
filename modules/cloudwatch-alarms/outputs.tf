output "cpu_high_alarm_name" {
    value = aws_cloudwatch_metric_alarm.cpu_high.alarm_name
}

output "status_check_failed_alarm_name" {
    value = aws_cloudwatch_metric_alarm.status_check_failed.alarm_name
}
