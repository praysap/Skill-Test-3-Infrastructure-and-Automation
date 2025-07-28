output "frontend_url" {
  value = "http://${aws_instance.ecommerce_server.public_ip}:3000"
}

output "instance_public_ip" {
  value = aws_instance.ecommerce_server.public_ip
}