output "configure_kubectl" {
  value = "aws eks --region ap-southeast-2 update-kubeconfig --name dev-rancher"
}