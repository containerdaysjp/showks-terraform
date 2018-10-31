resource "google_container_cluster" "showks-cluster-prod" {
    name               = "${var.cluster_name}-prod"
    zone               = "${var.zone}"
    initial_node_count = "${var.initial_node_count}"

    network            = "${var.network}"

    min_master_version = "${var.min_master_version}"
    node_version       = "${var.node_version}"

    node_config {
        machine_type   = "${var.machine_type}"
    }
    master_auth {
        username       = "${var.master_auth_username}"
        password       = "${var.master_auth_password}"
    }
}

resource "google_container_cluster" "showks-cluster-stg" {
    name               = "${var.cluster_name}-stg"
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
        username       = "${var.master_auth_username}"
        password       = "${var.master_auth_password}"
    }
}
