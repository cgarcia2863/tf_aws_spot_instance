output "spot_bid_status" {
  value = aws_spot_instance_request.cloud_instance.spot_bid_status
}

output "spot_request_state" {
  value = aws_spot_instance_request.cloud_instance.spot_request_state
}

output "spot_id" {
  value = aws_spot_instance_request.cloud_instance.id
}

output "spot_public_dns" {
  value = aws_spot_instance_request.cloud_instance.public_dns
}

output "spot_public_ip" {
  value = aws_spot_instance_request.cloud_instance.public_ip
}