variable "project" {}
variable "service_account_key" {}
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
variable "initial_node_count"{
  default = "3"
}
variable "machine_type" {
  default = "n1-standard-2"
}
variable "master_auth_username" {
  default = "admin"
}
variable "master_auth_password" {
  default= "foooobaaaaabaz"
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
