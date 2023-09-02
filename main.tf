module "vpc" {
  source          ="git::https://github.com/LalithaDendukuri/tf-module-vpc.git"

  for_each        = var.vpc
  cidr            = each.value["cidr"]
  subnets         = each.value["subnets"]
  default_vpc_id  =var.default_vpc_id
  default_vpc_cidr       = var.default_vpc_cidr
  default_route_table_id = var.default_route_table_id
  tags                  = var.tags
  env                   = var.env
}
output "vpc" {
  value = module.vpc
}

module "alb" {
  source          ="git::https://github.com/LalithaDendukuri/tf-module-alb.git"
  for_each        = var.alb
  internal        = each.value["internal"]
  lb_type         = each.value["lb_type"]
  sg_ingress_cidr = each.value["sg_ingress_cidr"]
  vpc_id          = each.value["internal"] ? local.vpc_id: var.default_vpc_id
  subnets         = each.value["internal"] ? local.app_subnet : data.aws_subnets.subnets.ids
  sg_port         = each.value["sg_port"]
  tags            = var.tags
  env             = var.env
}

module "docdb" {
  source          ="git::https://github.com/LalithaDendukuri/tf-module-docdb.git"
  for_each        = var.docdb

  tags            = var.tags
  env             = var.env
}