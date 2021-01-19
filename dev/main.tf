module "network" {
  source = "../modules/vpc"

  project_name  = var.project_name
  environment   = var.environment
  aws_region    = var.aws_region
  cidr_network            = var.cidr_network
  private_subnet1_network = var.private_subnet1_network
  private_subnet2_network = var.private_subnet2_network
  public_subnet1_network  = var.public_subnet1_network
  public_subnet2_network  = var.public_subnet2_network
}

module "master" {
  source = "../modules/master"

  project_name      = var.project_name
  aws_region        = var.aws_region
  k8s_version       = var.k8s_version
  cluster_vpc       = module.network.vpc
  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1b = module.network.private_subnet_1b
}

module "nodes" {
  source = "../modules/nodes"

  project_name = var.project_name
  aws_region   = var.aws_region
  k8s_version  = var.k8s_version

  vpc       = module.network.vpc
  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1b = module.network.private_subnet_1b

  eks_cluster    = module.master.eks_cluster
  eks_cluster_sg = module.master.security_group

  nodes_instances_sizes = var.nodes_instances_sizes
  auto_scale_options    = var.auto_scale_options

  auto_scale_cpu = var.auto_scale_cpu
}