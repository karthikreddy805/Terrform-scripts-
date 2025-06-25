variable "project_name" {}
variable "region" {}
variable "ecs_cluster_name" {}
variable "container_name" {}
variable "container_image" {}
variable "task_execution_role_name" {}
variable "task_role_name" {}
variable "cpu" {}
variable "memory" {}
variable "subnets" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}
