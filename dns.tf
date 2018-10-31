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
