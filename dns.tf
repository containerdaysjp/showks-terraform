data "google_dns_managed_zone" "showks_zone" {
  name = "${var.managed_zone}"
}

resource "google_dns_record_set" "jumpbox" {
  name = "jumpbox.${data.google_dns_managed_zone.showks_zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${data.google_dns_managed_zone.showks_zone.name}"

  rrdatas = ["${google_compute_address.jumpbox-ip.address}"]
}

resource "google_dns_record_set" "concourse" {
  name = "concourse.${data.google_dns_managed_zone.showks_zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${data.google_dns_managed_zone.showks_zone.name}"

  rrdatas = ["${google_compute_global_address.concourse_ip.address}"]
}

resource "google_dns_record_set" "spinnaker_api" {
  name = "spinnaker-api.${data.google_dns_managed_zone.showks_zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${data.google_dns_managed_zone.showks_zone.name}"

  rrdatas = ["${google_compute_address.spinnaker_api_ip.address}"]
}

resource "google_dns_record_set" "spinnaker_ui" {
  name = "spinnaker-ui.${data.google_dns_managed_zone.showks_zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${data.google_dns_managed_zone.showks_zone.name}"

  rrdatas = ["${google_compute_address.spinnaker_ui_ip.address}"]
}

resource "google_dns_record_set" "stg_ingress_nginx" {
  name = "ingress-nginx.stg.${data.google_dns_managed_zone.showks_zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${data.google_dns_managed_zone.showks_zone.name}"

  rrdatas = ["${var.stg_ingress_nginx_address}"]
}

resource "google_dns_record_set" "stg_wildcard" {
  name = "*.stg.${data.google_dns_managed_zone.showks_zone.dns_name}"
  type = "CNAME"
  ttl  = 300

  managed_zone = "${data.google_dns_managed_zone.showks_zone.name}"

  rrdatas = ["${google_dns_record_set.stg_ingress_nginx.name}"]
}
