output "Instance_Public_IP" {
  value = aws_instance.helloworld.public_ip
}
output "Instance_ID" {
  value = aws_instance.helloworld.id
}
output "Website_URL" {
  value = "http://${aws_instance.helloworld.public_ip}"
}