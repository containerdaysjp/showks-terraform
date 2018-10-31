resource "google_container_cluster" "cluster-prod" {
    name               = "${var.env_name}-${var.cluster_name}-prod"
    zone               = "${var.zone}"
    initial_node_count = "${var.initial_node_count}"

    network            = "${var.network}"

    min_master_version = "${var.min_master_version}"
    node_version       = "${var.node_version}"

    node_config {
        machine_type   = "${var.machine_type}"
    }
    master_auth {
        username       = "admin"
        password       = "${random_string.password.result}"
    }
}

resource "google_container_cluster" "cluster-stg" {
    name               = "${var.env_name}-${var.cluster_name}-stg"
    zone               = "${var.zone}"
    initial_node_count = "${var.initial_node_count}"

    network            = "${var.network}"

    min_master_version = "${var.min_master_version}"
    node_version       = "${var.node_version}"

    node_config {
        machine_type   = "${var.machine_type}"
        preemptible    = true
    }
    master_auth {
        username       = "admin"
        password       = "${random_string.password.result}"
    }
}

resource "random_string" "password" {
  length = 16
  special = true
}

