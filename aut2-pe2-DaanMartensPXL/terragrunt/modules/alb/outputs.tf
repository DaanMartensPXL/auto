output "alb_dns_name" {
  description = "The DNS name of the ALB."
  value       = aws_lb.alb.dns_name
}

output "target_group_arn" {
  description = "The ARN of the Target Group."
  value       = aws_lb_target_group.target_group.arn
}

output "listener_arn" {
  description = "The ARN of the Load Balancer Listener."
  value       = aws_lb_listener.listener.arn
}
