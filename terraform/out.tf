output "aws_ecr_repository" {
  value = aws_ecr_repository.kittens
}

output "subnet_ids" {
    value = aws_subnet.app_subnets[*].id
}

output "availability_zones" {
    value = data.aws_availability_zones.availability_zones
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.aws_eks.endpoint
}

output "eks_cluster_certificate_authority" {
  value = aws_eks_cluster.aws_eks.certificate_authority 
}
