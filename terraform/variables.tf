variable "region" {
  description = "AWS Region"
  default = "us-east-1"
}


variable "vpc_name" {
  type = string
  default = "vpc_demo"
}

variable "vpc_cidr_range" {
    type = string
    default =  "10.60.0.0/16"
}

variable "subnets" {
  default =  ["10.60.1.0/24", "10.60.2.0/24"]
}

variable "eks_cluster_name" {
    type = string
    default =  "demo-eks"
}