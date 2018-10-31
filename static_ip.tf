resource "google_compute_address" "jumpbox-ip" {
  name = "${var.env_name}-jumpbox-ip"
}

resource "google_compute_global_address" "concourse_ip" {
  name = "${var.env_name}-concourse-ip"
}

resource "google_compute_address" "spinnaker_api_ip" {
  name = "${var.env_name}-api-ip"
}

resource "google_compute_address" "spinnaker_ui_ip" {
  name = "${var.env_name}-ui-ip"
}

