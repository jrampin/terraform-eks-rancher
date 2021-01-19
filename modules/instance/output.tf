output "rancher_instance" {
  value = aws_instance.rancher_instance.public_ip
}

output "k8s-1_instance" {
  value = aws_instance.k8s-1_instance.public_ip
}

output "k8s-2_instance" {
  value = aws_instance.k8s-2_instance.public_ip
}

output "k8s-3_instance" {
  value = aws_instance.k8s-3_instance.public_ip
}
