resource "google_compute_address" "jumpbox-ip" {
  name = "${var.env_name}-jumpbox-ip"
}

