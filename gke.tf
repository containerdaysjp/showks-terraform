resource "google_container_cluster" "cluster_prod" {
  name               = "${var.env_name}-${var.cluster_name}-prod"
  zone               = "${var.zone}"

  network            = "${var.network}"

  min_master_version = "${var.min_master_version}"
  node_version       = "${var.node_version}"
  node_pool = {
    name = "default-pool"
  }
  lifecycle {
    ignore_changes = [
      "node_pool",
      "ip_allocation_policy",
    ]
  }
}

resource "google_container_node_pool" "np_prod" {
  name               = "${var.env_name}-${var.cluster_name}-prod-np"
  zone               = "${var.zone}"
  cluster            = "${google_container_cluster.cluster_prod.name}"
  node_count         = "${var.prod_node_count}"

  node_config {
    machine_type   = "${var.machine_type}"
  }
}

resource "google_container_cluster" "cluster-stg" {
  name               = "${var.env_name}-${var.cluster_name}-stg"
  zone               = "${var.zone}"
  initial_node_count = "${var.stg_node_count}"

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

