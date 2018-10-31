output "jumpbox-ip" {
  value = "${google_compute_address.jumpbox-ip.address}"
}

output "cluster_password" {
  value = "${random_string.password.result}"
}

output "prod_client_certificate" {
  value = "${google_container_cluster.cluster_prod.master_auth.0.client_certificate}"
}

output "prod_client_key" {
  value = "${google_container_cluster.cluster_prod.master_auth.0.client_key}"
}

output "prod_cluster_ca_certificate" {
  value = "${google_container_cluster.cluster_prod.master_auth.0.cluster_ca_certificate}"
}
output "stg_client_certificate" {
  value = "${google_container_cluster.cluster-stg.master_auth.0.client_certificate}"
}

output "stg_client_key" {
  value = "${google_container_cluster.cluster-stg.master_auth.0.client_key}"
}

output "stg_cluster_ca_certificate" {
  value = "${google_container_cluster.cluster-stg.master_auth.0.cluster_ca_certificate}"
}
