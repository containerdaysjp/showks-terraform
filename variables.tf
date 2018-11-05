variable "project" {}
variable "cluster_name" {
  default = "gke"
}
variable "region" {
  default = "asia-northeast1"
}
variable "zone" {
  default = "asia-northeast1-a"
}
variable "network" {
  default = "default"
}
variable "stg_node_count"{
  default = "3"
}
variable "prod_node_count"{
  default = "3"
}
variable "machine_type" {
  default = "n1-standard-2"
}
variable "master_auth_password" {
  default= "foooobaaaaabazbazbazbazbaz"
}
variable "min_master_version" {
  default = "1.10.7-gke.6"
}
variable "node_version" {
  default = "1.10.7-gke.6"
}
variable "env_name" {}

variable "zones" {
  type = "list"
}
variable "jumpbox_machine_type" {
  default = "g1-small"
}
variable "managed_zone" {}
variable "stg_ingress_nginx_address" {}
