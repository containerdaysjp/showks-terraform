# Allow HTTP/S access to Ops Manager from the outside world
resource "google_compute_firewall" "jumpbox-external" {
  name        = "${var.env_name}-jumpbox-external"
  network     = "${var.network}"
  target_tags = ["${var.env_name}-jumpbox-external"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_instance" "jumpbox" {
  name         = "${var.env_name}-jumpbox"
  machine_type = "${var.jumpbox_machine_type}"
  zone         = "${element(var.zones, 1)}"
  tags         = ["${var.env_name}-jumpbox-external"]
  allow_stopping_for_update = true

  timeouts {
    create = "10m"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size  = 150
    }
  }

  network_interface {
    network = "${var.network}"

    access_config {
      nat_ip = "${google_compute_address.jumpbox-ip.address}"
    }
  }

  metadata = {
    ssh-keys               = "${format("ubuntu:%s", tls_private_key.jumpbox.public_key_openssh)}"
    block-project-ssh-keys = "FALSE"
  }
}

resource "tls_private_key" "jumpbox" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}
