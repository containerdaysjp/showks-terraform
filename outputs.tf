output "jumpbox-ip" {
  value = "${google_compute_address.jumpbox-ip.address}"
}

output "cluster_password" {
  value = "${random_string.password.result}"
}
