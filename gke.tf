resource "google_container_cluster" "showks-cluster" {
    name               = "${var.cluster_name}"
    zone               = "${var.zone}"
    initial_node_count = "${var.initial_node_count}"

    network            = "${var.network}"

    min_master_version     = "${var.min_master_version}"
    node_version       = "${var.node_version}"

    node_config {
        machine_type   = "${var.machine_type}"
    }
    master_auth {
        username       = "${var.master_auth_username}"
        password       = "${var.master_auth_password}"
    }
}
