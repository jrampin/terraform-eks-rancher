variable "aws_region" {
  default = "ap-southeast-2"
}

variable "project_name" {
  default = "dev-rancher"
}

variable "cidr_network" {
  default = "10.0.0.0/16"
}

variable "public_subnet1_network" {
  default = "10.0.0.0/20"
}

variable "public_subnet2_network" {
  default = "10.0.16.0/20"
}

variable "private_subnet1_network" {
  default = "10.0.32.0/20"
}

variable "private_subnet2_network" {
  default = "10.0.48.0/20"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "domain_name" {
  default = "eit-demo.com"
}

variable "k8s_version" {
  default = "1.18"
}

variable "nodes_instances_sizes" {
  default = [
    "t3.large"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 2
    max     = 10
    desired = 2
  }
}

variable "auto_scale_cpu" {
  default = {
    scale_up_threshold  = 80
    scale_up_period     = 60
    scale_up_evaluation = 2
    scale_up_cooldown   = 300
    scale_up_add        = 2

    scale_down_threshold  = 40
    scale_down_period     = 120
    scale_down_evaluation = 2
    scale_down_cooldown   = 300
    scale_down_remove     = -1
  }
}